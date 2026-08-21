package Database::Join;

# ABSTRACT: Combined view across two or more Database::Abstraction objects

use strict;
use warnings;
use autodie qw(:all);

use Carp qw(croak carp);
use List::Util qw(max);
use Readonly;
use Scalar::Util qw(blessed);
use Params::Get qw(get_params);
use Params::Validate::Strict qw(validate_strict);

our $VERSION = '0.01';

# ---------------------------------------------------------------------------
# All user-facing strings route through this dictionary.  Supply an i18n
# object with a translate($key, @sprintf_args) method to localise them.
# ---------------------------------------------------------------------------
Readonly::Hash my %MESSAGES => (
	error_no_databases	=> 'At least one Database::Abstraction object is required',
	error_invalid_db	=> 'databases[%d] is not a Database::Abstraction object',
	error_join_col_missing	=> 'join_column "%s" is absent from databases[%d] (%s)',
	error_col_conflict	=> 'Column "%s" exists in multiple databases; '
	                         . 'use the owning database directly or rename the column',
	error_remove_join_col	=> 'Cannot remove join_column "%s"; it is required for the join',
	warn_unknown_column	=> 'Column "%s" is not present in any configured database; criterion ignored',
	warn_empty_result	=> 'Cross-database join produced an empty result set',
	error_query_unsupported	=> 'query() chained builder is not supported on Database::Join; '
	                            . 'call selectall_arrayref / fetchrow_hashref directly',
	error_execute_unsupported => 'execute() raw SQL is not supported on Database::Join',
	error_unknown_message	=> 'Unknown message key "%s"',
);

=head1 NAME

Database::Join - Combined view across two or more databases

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

    use Database::Join;

    # Each object is an already-instantiated Database::Abstraction subclass
    my $customers = Database::Customers->new(directory => '/data');
    my $loyalty   = Database::Loyalty->new(directory  => '/data');

    my $join = Database::Join->new(
        databases      => [ $customers, $loyalty ],
        join_column    => 'entry',              # shared key column (default: 'entry')
        remove_columns => [ 'email', 'notes' ], # columns to hide (optional)
    );

    # When the join key has different names in each database, use join_map.
    # $cities  (index 0) has a column called 'statecode'  — matches join_column, no entry needed.
    # $stnames (index 1) has a column called 'entry'      — different name, so declare it.
    my $join2 = Database::Join->new(
        databases   => [ $cities,  $stnames ],
        #                index 0   index 1
        join_column => 'statecode',
        join_map    => { 1 => 'entry' },   # index 1's local name for the join key
    );
    my $rows = $join2->selectall_arrayref();  # every row uses 'statecode'; 'entry' never appears

    # Same API as Database::Abstraction ---------------------------------

    # All rows from both databases merged on the join_column
    my $rows = $join->selectall_arrayref();

    # Criteria on either database work transparently
    my $vip  = $join->selectall_arrayref(tier => 'gold');
    my $row  = $join->fetchrow_hashref(entry => 'C001');

    # AUTOLOAD column shortcut
    my $name = $join->name(entry => 'C001');

    # Introspection (hidden columns are absent)
    my $all_cols = $join->columns();   # union of all databases' columns
    my $schema   = $join->schema();    # merged schema

    # Add another database to the view (chainable, same API as new)
    $join->add_database($scores)
         ->add_database($db4, remove_columns => ['audit_ts']);

    # Remove a column after construction
    $join->remove_column('internal_id');

=head1 DESCRIPTION

C<Database::Join> merges two or more L<Database::Abstraction> objects into a
single logical view.  Each component database is queried independently through
its own C<Database::Abstraction> interface; the results are then combined
in Perl memory using a shared key column (C<join_column>).

The module exposes the same read-only API as C<Database::Abstraction>:
C<selectall_arrayref>, C<selectall_array>, C<fetchrow_hashref>, C<count>,
C<columns>, C<schema>, C<updated>, and the C<AUTOLOAD> column shortcut.

=head2 Join semantics

The C<join_type> parameter controls what happens when a key value exists in
some databases but not all:

=over 4

=item C<left> (default)

All rows from the I<primary> (first) database are returned.  Columns from
subsequent databases are filled in where a matching row is found and omitted
where there is no match.

=item C<inner>

Only rows whose join-column value is present in I<every> component database
are returned.

=item C<outer>

Every join-column value found in I<any> database is returned.  Missing columns
from databases that lack that key are simply absent from the merged row.

=back

=head2 Column ownership

At construction time C<Database::Join> calls C<columns()> on each database to
build an internal column-to-database index.  When criteria are passed to a
query method, each criterion is routed to the database that owns the column.

The C<join_column> itself is treated specially: criteria on it are broadcast
to I<all> databases so that each database fetches only the relevant rows.

When the same non-join column name exists in more than one database, the
I<last> database's value overwrites earlier ones in merged rows.

=head1 LIMITATIONS

=over 4

=item *

In-memory join only.  Not suitable for very large result sets.

=item *

The C<query()> chained builder and C<execute()> raw SQL are not supported.

=item *

Only equi-joins on a single shared key column are implemented.  When the join
key has different names across databases, use C<join_map> to declare the
per-database column name.

=item *

Sorting is performed on the C<join_column> value only.  Per-column C<ORDER BY>
from the caller is not propagated.

=back

=head1 METHODS

=head2 new

=head3 SYNOPSIS

    my $join = Database::Join->new(
        databases      => [ $db1, $db2 ],          # required
        join_column    => 'entry',                  # optional, default 'entry'
        join_type      => 'left',                   # optional, default 'left'
        join_map       => { 1 => 'local_col' },    # optional — see join_map section below
        remove_columns => [ 'email', 'internal_id' ], # optional
        logger         => $log,                     # optional
        i18n           => $locale,                  # optional
    );

=head3 DESCRIPTION

Constructs and returns a new C<Database::Join> object.  Each element of
C<databases> must be an instantiated subclass of C<Database::Abstraction>.
The C<join_column> must be present in all component databases.

Columns listed in C<remove_columns> are hidden from the merged view: they
do not appear in C<columns()>, C<schema()>, or any returned row hashref,
and criteria that reference them are silently dropped.  This is equivalent
to calling C<remove_column> once per name after construction.

=head3 API SPECIFICATION

=head4 Input

    databases      => { type => 'arrayref', required => 1 }
    join_column    => { type => 'string',   optional => 1, default => 'entry' }
    join_type      => { type => 'string',   optional => 1, default => 'left',
                        enum => ['inner','left','outer'] }
    join_map       => { type => 'hashref',  optional => 1 }
                      # Keys are zero-based indices into 'databases';
                      # values are the local column name for the join key
                      # in that database.  See the join_map section below.
    remove_columns => { type => 'arrayref', optional => 1 }
    logger         => { type => 'object',   optional => 1 }
    i18n           => { type => 'object',   optional => 1 }

=head4 Output

    Database::Join blessed object reference.

=cut

sub new {
	my ($class, @args) = @_;

	my $p = validate_strict(
		schema => {
			databases	=> { type => 'arrayref' },
			join_column	=> { type => 'string',   optional => 1, default => 'entry' },
			join_type	=> { type => 'string',   optional => 1, default => 'left',
			                  enum => ['inner', 'left', 'outer'] },
			join_map	=> { type => 'hashref',  optional => 1 },
			remove_columns	=> { type => 'arrayref', optional => 1 },
			logger		=> { type => 'object',   optional => 1 },
			i18n		=> { type => 'object',   optional => 1 },
		},
		input => get_params(undef, \@args) // {},
	);

	croak _msg($p->{i18n}, 'error_no_databases')
		unless @{ $p->{databases} };

	for my $i (0 .. $#{ $p->{databases} }) {
		croak _msg($p->{i18n}, 'error_invalid_db', $i)
			unless blessed($p->{databases}[$i])
			    && $p->{databases}[$i]->isa('Database::Abstraction');
	}

	my $self = bless {
		_dbs          => $p->{databases},
		_join_col     => $p->{join_column},
		_join_type    => $p->{join_type},
		_join_map     => $p->{join_map} // {},	# db_index => local join col name
		_logger       => $p->{logger},
		_i18n         => $p->{i18n},
		_col_db       => {},	# column_name => db_index
		_db_cols      => [],	# per-db column-presence hashref
		_removed_cols => {},	# column_name => 1 (hidden from the view)
		_col_cache    => undef,	# memoised columns() result
		_schema_cache => undef,	# memoised schema() result
	}, $class;

	$self->_build_col_index();

	# Apply column removals requested in the constructor
	if (my $rc = $p->{remove_columns}) {
		$self->remove_column($_) for @{$rc};
	}

	return $self;
}

# ---------------------------------------------------------------------------
# Public API (mirrors Database::Abstraction)
# ---------------------------------------------------------------------------

=head2 join_map — joining on differently-named columns

By default every component database must have a column whose name matches
C<join_column>.  If a database calls that column something different, declare
the mapping with C<join_map>.

C<join_map> is a hashref.  Each B<key> is the B<zero-based position> of a
database in the C<databases> array (0 = first, 1 = second, and so on).  Each
B<value> is the name that B<that database> uses for the join key.  Databases
not listed in C<join_map> are assumed to already have a column named
C<join_column>.

Throughout the merged view the join key is always referred to by
C<join_column>; the local alias is never exposed in returned rows, in
C<columns()>, or in C<schema()>.

B<Example> — cities table uses C<statecode>; state-names table uses C<entry>:

    #                       index 0     index 1
    my @databases = (      $cities,    $stnames  );
    #  column name:       'statecode'  'entry'
    #  join_column:       'statecode'  — already matches, no map needed
    #                                  — different name, declare it:

    my $join = Database::Join->new(
        databases   => \@databases,
        join_column => 'statecode',
        join_map    => { 1 => 'entry' },   # $stnames (index 1) calls it 'entry'
    );

    my $rows = $join->selectall_arrayref();           # rows use 'statecode'
    my $row  = $join->fetchrow_hashref(statecode => 'CA');

If you are adding a database with C<add_database> instead of listing it in
the constructor, pass C<join_column> to name the incoming database's local
column:

    my $join2 = Database::Join->new(databases => [$cities], join_column => 'statecode');
    $join2->add_database($stnames, join_column => 'entry');

This is exactly equivalent to using C<join_map => { 1 => 'entry' }> in the
constructor.

=head2 selectall_arrayref

=head3 SYNOPSIS

    my $rows = $join->selectall_arrayref();
    my $rows = $join->selectall_arrayref(tier  => 'gold');
    my $rows = $join->selectall_arrayref(score => { '>' => 80 });
    my $rows = $join->selectall_arrayref(entry => 'C001');

=head3 DESCRIPTION

Returns an arrayref of hashrefs representing the merged view of all component
databases, filtered by any supplied criteria.  Criteria for columns that exist
in different databases are partitioned and evaluated independently; results are
joined in memory on C<join_column>.

Accepts the same criteria syntax as C<Database::Abstraction::selectall_arrayref>.

=head3 API SPECIFICATION

=head4 Input

    Criteria: any flat key-value pairs accepted by Database::Abstraction,
    where keys are column names and values are plain scalars, comparison
    hashrefs, or set operators.  The join_column may be passed positionally
    when it is the sole argument and equals 'entry'.

=head4 Output

    Arrayref of hashrefs, one per unique join_column value, sorted
    ascending by join_column.

=cut

sub selectall_arrayref {
	my ($self, @args) = @_;

	my $params = !@args                          ? {}
	           : (@args == 1 && !ref($args[0])) ? { $self->{_join_col} => $args[0] }
	           :                                   (get_params(undef, @args) // {});

	return $self->_joined_query($params);
}

=head2 selectall_array

=head3 SYNOPSIS

    my @rows = $join->selectall_array(status => 'active');

    # Scalar context applies LIMIT 1 (first match only)
    my $row  = $join->selectall_array(entry => 'C001');

=head3 DESCRIPTION

In list context returns a list of hashrefs (same rows as C<selectall_arrayref>).
In scalar context applies an implicit limit and returns only the first match.

=head3 API SPECIFICATION

=head4 Input

    Same criteria syntax as selectall_arrayref.

=head4 Output

    List context:   list of hashrefs.
    Scalar context: single hashref or undef.

=cut

sub selectall_array {
	my ($self, @args) = @_;

	my $params = !@args                          ? {}
	           : (@args == 1 && !ref($args[0])) ? { $self->{_join_col} => $args[0] }
	           :                                   (get_params(undef, @args) // {});
	my $rows   = $self->_joined_query($params);

	return wantarray ? @{$rows} : $rows->[0];
}

=head2 fetchrow_hashref

=head3 SYNOPSIS

    my $row = $join->fetchrow_hashref(entry => 'C001');
    my $row = $join->fetchrow_hashref('C001');   # when join_column is 'entry'

=head3 DESCRIPTION

Returns a single merged hashref for the first row matching the criteria,
or C<undef> when there is no match.  Equivalent to calling
C<selectall_arrayref> and taking the first element.

Accepts the same criteria as C<selectall_arrayref>.

=head3 API SPECIFICATION

=head4 Input

    Same criteria syntax as selectall_arrayref.

=head4 Output

    Hashref, or undef.

=cut

sub fetchrow_hashref {
	my ($self, @args) = @_;

	my $params = !@args                          ? {}
	           : (@args == 1 && !ref($args[0])) ? { $self->{_join_col} => $args[0] }
	           :                                   (get_params(undef, @args) // {});
	my $rows   = $self->_joined_query($params);

	return $rows->[0];
}

=head2 count

=head3 SYNOPSIS

    my $total  = $join->count();
    my $active = $join->count(tier => 'gold');

=head3 DESCRIPTION

Returns the number of merged rows that satisfy the given criteria.
Implemented by running the full join and counting the result; use with care
on large datasets.

=head3 API SPECIFICATION

=head4 Input

    Same criteria syntax as selectall_arrayref.

=head4 Output

    Non-negative integer.

=cut

sub count {
	my ($self, @args) = @_;

	my $params = !@args                          ? {}
	           : (@args == 1 && !ref($args[0])) ? { $self->{_join_col} => $args[0] }
	           :                                   (get_params(undef, @args) // {});
	my $rows   = $self->_joined_query($params);

	return scalar @{$rows};
}

=head2 columns

=head3 SYNOPSIS

    my $cols = $join->columns();

=head3 DESCRIPTION

Returns an arrayref of all column names present across all component
databases, deduplicated and sorted alphabetically.  The C<join_column>
appears exactly once regardless of how many databases contain it.

=head3 API SPECIFICATION

=head4 Input

    None.

=head4 Output

    Arrayref of column name strings.

=cut

sub columns {
	my ($self) = @_;

	return $self->{_col_cache} if $self->{_col_cache};

	my %seen;
	my @cols;
	my $join_col = $self->{_join_col};

	for my $i (0 .. $#{ $self->{_dbs} }) {
		my $local_jc = $self->{_join_map}{$i};
		for my $col (@{ $self->{_dbs}[$i]->columns() }) {
			next if $seen{$col}++;
			next if $self->{_removed_cols}{$col};
			# The local join-key alias is not a data column; the canonical name
			# is already contributed by the database that owns it under that name.
			next if $local_jc && $col eq $local_jc && $col ne $join_col;
			push @cols, $col;
		}
	}

	$self->{_col_cache} = [ sort @cols ];
	return $self->{_col_cache};
}

=head2 schema

=head3 SYNOPSIS

    my $schema = $join->schema();

=head3 DESCRIPTION

Returns a merged schema hashref for all columns across all component
databases.  Each key is a column name; each value follows the
C<Database::Abstraction::schema()> contract:
C<{ type, nullable, default, pk }>.

When the same column name appears in more than one database the I<last>
database's metadata is used.

=head3 API SPECIFICATION

=head4 Input

    None.

=head4 Output

    Hashref: column_name => { type, nullable, default, pk }.

=cut

sub schema {
	my ($self) = @_;

	return $self->{_schema_cache} if $self->{_schema_cache};

	my %merged;
	for my $i (0 .. $#{ $self->{_dbs} }) {
		my $s        = $self->{_dbs}[$i]->schema();
		my $local_jc = $self->{_join_map}{$i};
		if ($local_jc && $local_jc ne $self->{_join_col}) {
			my %s_copy = %{$s};
			delete $s_copy{$local_jc};
			%merged = (%merged, %s_copy);
		} else {
			%merged = (%merged, %{$s});
		}
	}

	delete $merged{$_} for keys %{ $self->{_removed_cols} };

	$self->{_schema_cache} = \%merged;
	return $self->{_schema_cache};
}

=head2 updated

=head3 SYNOPSIS

    my $ts = $join->updated();

=head3 DESCRIPTION

Returns the Unix timestamp of the most recent update across all component
databases (i.e. the maximum of all individual C<updated()> return values).

=head3 API SPECIFICATION

=head4 Input

    None.

=head4 Output

    Unix timestamp (integer).

=cut

sub updated {
	my ($self) = @_;

	my @times = map { $_->updated() } @{ $self->{_dbs} };
	return max(@times);
}

=head2 set_logger

=head3 SYNOPSIS

    $join->set_logger($log);

=head3 DESCRIPTION

Propagates a new logger object to all component databases and stores it
locally for C<Database::Join>'s own diagnostic output.

=head3 API SPECIFICATION

=head4 Input

    $log    Positional: a logger object (required)

=head4 Output

    Returns $self for chaining.

=cut

sub set_logger {
	my ($self, $logger) = @_;

	croak 'Usage: set_logger($logger)' unless defined $logger;

	$self->{_logger} = $logger;
	$_->set_logger($logger) for @{ $self->{_dbs} };

	return $self;
}

=head2 add_database

=head3 SYNOPSIS

    $join->add_database($db);
    $join->add_database($db, remove_columns => ['email']);
    $join->add_database(database => $db);

    # Chainable
    $join->add_database($db1)->add_database($db2, remove_columns => ['notes']);

=head3 DESCRIPTION

Adds one more L<Database::Abstraction> subclass object to the logical view
and updates the column ownership index.

The C<join_column> must be present in the new database.  After the call,
rows returned by any query method include columns from the newly added
database, and criteria on those columns are routed to it.  When a column
name already exists in an earlier database, the new database becomes the
authoritative source (last-database-wins, the same rule applied at
construction time).

The method mirrors the parameter conventions of C<new>:

=over 4

=item Positional: C<< $join->add_database($db) >>

=item Named: C<< $join->add_database(database => $db) >>

=item Named with options: C<< $join->add_database($db, remove_columns => [...]) >>

=back

An optional C<remove_columns> list hides specific columns from the newly
added database in exactly the same way as calling C<remove_column> for each.

When the join key has a different name in the new database, pass
C<< join_column => 'local_name' >> to declare that alias:

    # 'statecode' is the canonical join key; the new database calls it 'entry'
    $join->add_database($capitals, join_column => 'entry');

The logger is propagated to the new database if one was set on the join.

=head3 API SPECIFICATION

=head4 Input

    database       => { type => 'object',   required => 1 }
    join_column    => { type => 'string',   optional => 1 }
    remove_columns => { type => 'arrayref', optional => 1 }

=head4 Output

    Returns C<$self> to support method chaining.

=cut

sub add_database {
	my ($self, @args) = @_;

	my $idx = scalar @{ $self->{_dbs} };
	my $db;

	if (@args && ref($args[0])) {
		# Positional form: first arg is a reference — extract it now so that
		# get_params does not choke on the mixed positional+named-pairs pattern.
		$db = shift @args;
	} elsif (@args && !ref($args[0])) {
		# First arg is a plain string. Only known named-pair keys are valid here;
		# anything else is treated as an invalid positional database arg.
		croak _msg($self->{_i18n}, 'error_invalid_db', $idx)
			unless $args[0] eq 'database'
			    || $args[0] eq 'remove_columns'
			    || $args[0] eq 'join_column';
	}

	my $p = validate_strict(
		schema => {
			database       => { type => 'object',   optional => 1 },
			join_column    => { type => 'string',   optional => 1 },
			remove_columns => { type => 'arrayref', optional => 1 },
		},
		input => (@args ? get_params(undef, @args) : {}) // {},
	);

	$db //= $p->{database};

	croak _msg($self->{_i18n}, 'error_invalid_db', $idx)
		unless blessed($db) && $db->isa('Database::Abstraction');

	# Determine and register the local join column name for this database
	my $local_jc = $p->{join_column} // $self->{_join_col};
	$self->{_join_map}{$idx} = $local_jc if $p->{join_column};

	my $cols         = $db->columns();
	my %col_presence = map { $_ => 1 } @{$cols};

	croak _msg($self->{_i18n}, 'error_join_col_missing',
	           $local_jc, $idx, ref($db))
		unless $col_presence{$local_jc};

	# Register the new database
	push @{ $self->{_dbs} },     $db;
	push @{ $self->{_db_cols} }, \%col_presence;

	# Update column routing: last-database-wins for duplicate column names;
	# skip the local join-key alias (it is not a data column).
	for my $col (@{$cols}) {
		next if $self->{_removed_cols}{$col};
		next if $local_jc ne $self->{_join_col} && $col eq $local_jc;
		$self->{_col_db}{$col} = $idx;
	}

	# Invalidate memoisation caches
	$self->{_col_cache}    = undef;
	$self->{_schema_cache} = undef;

	# Propagate logger if one is configured
	if (my $log = $self->{_logger}) {
		$db->set_logger($log);
	}

	# Apply any column removals requested for this database
	if (my $rc = $p->{remove_columns}) {
		$self->remove_column($_) for @{$rc};
	}

	return $self;
}

=head2 remove_column

=head3 SYNOPSIS

    $join->remove_column('email');
    $join->remove_column('internal_id')->remove_column('audit_ts');  # chainable

=head3 DESCRIPTION

Hides a column from the merged view.  After calling this method:

=over 4

=item *

The column is absent from C<columns()> and C<schema()>.

=item *

Returned row hashrefs no longer contain the column key.

=item *

Criteria referencing the column are dropped with a C<carp> warning (the
same behaviour as querying by a column that was never present).

=back

Removing the C<join_column> is not permitted and will C<croak>.
Removing a column that does not exist in any database is silently ignored
(idempotent).  The C<columns()> and C<schema()> memoisation caches are
cleared automatically.

=head3 API SPECIFICATION

=head4 Input

    $col    Positional string: the column name to remove (required)

=head4 Output

    Returns C<$self> to support method chaining.

=cut

sub remove_column {
	my ($self, $col) = @_;

	croak _msg($self->{_i18n}, 'error_remove_join_col', $col)
		if defined $col && $col eq $self->{_join_col};

	if (defined $col && length $col) {
		$self->{_removed_cols}{$col} = 1;
		delete $self->{_col_db}{$col};
		$self->{_col_cache}    = undef;
		$self->{_schema_cache} = undef;
	}

	return $self;
}

=head2 query

Not supported.  C<Database::Join> does not implement the chained query
builder.  Use C<selectall_arrayref> or C<fetchrow_hashref> directly.

=cut

sub query {
	my ($self) = @_;
	croak _msg($self->{_i18n}, 'error_query_unsupported');
}

=head2 execute

Not supported.  Raw SQL cannot be executed across heterogeneous backends.
Use the Perl-level query methods instead.

=cut

sub execute {
	my ($self) = @_;
	croak _msg($self->{_i18n}, 'error_execute_unsupported');
}

=head2 AUTOLOAD - column shortcut

Calling an unknown method whose name matches a column name performs a
column lookup, delegated to whichever component database owns that column.

    my $name = $join->name(entry => 'C001');
    my @tiers = $join->tier();

=cut

our $AUTOLOAD;
sub AUTOLOAD {
	my $self = shift;

	my ($col) = $AUTOLOAD =~ /::(\w+)$/;
	return if $col eq 'DESTROY';
	return if $col =~ /^_/;

	my $db_idx = $self->{_col_db}{$col};
	if (!defined $db_idx) {
		croak ref($self), ": Unknown column $col";
	}

	my $db = $self->{_dbs}[$db_idx];

	# When join_map is in use the owning database's primary key may differ from
	# the primary database's entry key, so delegating directly would look up
	# the wrong key.  Do a full join query instead and extract the column.
	if (%{ $self->{_join_map} }) {
		my $pk     = $self->{_dbs}[0]{id} // 'entry';
		my $params = !@_                          ? {}
		           : (@_ == 1 && !ref($_[0]))     ? { $pk => $_[0] }
		           :                                 (get_params(undef, @_) // {});
		my $rows = $self->_joined_query($params);
		return map { $_->{$col} } @{$rows} if wantarray;
		return @{$rows} ? $rows->[0]{$col} : undef;
	}

	return $db->$col(@_);
}

sub DESTROY {}

# ---------------------------------------------------------------------------
# Private helpers
# ---------------------------------------------------------------------------

# _build_col_index()
# Calls columns() on each database at construction time to populate
# _col_db (column => db_index) and _db_cols (per-db column lists).
# The join_column is verified to exist in every database.
sub _build_col_index {
	my ($self) = @_;

	my $join_col = $self->{_join_col};
	my %col_db;
	my @db_cols;

	for my $i (0 .. $#{ $self->{_dbs} }) {
		my $db        = $self->{_dbs}[$i];
		my $local_jc  = $self->{_join_map}{$i} // $join_col;
		my $cols      = $db->columns();
		$db_cols[$i]  = { map { $_ => 1 } @{$cols} };

		croak _msg($self->{_i18n}, 'error_join_col_missing',
		           $local_jc, $i, ref($db))
			unless $db_cols[$i]{$local_jc};

		for my $col (@{$cols}) {
			# Skip the local alias for the join key — it is not a data column
			next if $local_jc ne $join_col && $col eq $local_jc;
			# Last database wins for duplicate non-join columns
			$col_db{$col} = $i;
		}
	}

	$self->{_col_db}  = \%col_db;
	$self->{_db_cols} = \@db_cols;

	return;
}

# _partition_criteria( \%params ) -> \@per_db
# Splits a criteria hashref into per-database slices, routing each
# criterion to the database that owns its column.  The join_column is
# broadcast to all databases.  Unknown columns trigger a carp and are dropped.
sub _partition_criteria {
	my ($self, $params) = @_;

	my $join_col = $self->{_join_col};
	my $n        = scalar @{ $self->{_dbs} };
	my @per_db   = map { {} } 1 .. $n;

	for my $col (keys %{$params}) {
		if ($col eq $join_col) {
			# Broadcast to every database using each one's local key column name
			for my $i (0 .. $n - 1) {
				my $local = $self->{_join_map}{$i} // $join_col;
				$per_db[$i]{$local} = $params->{$col};
			}
		} elsif (defined(my $idx = $self->{_col_db}{$col})) {
			$per_db[$idx]{$col} = $params->{$col};
		} else {
			carp _msg($self->{_i18n}, 'warn_unknown_column', $col);
		}
	}

	return \@per_db;
}

# _fetch_indexed( $db_idx, \%criteria ) -> \%join_val_to_\@rows
# Queries one component database and returns a hashref where each key maps
# to an arrayref of all rows sharing that join-column value.  Multiple rows
# per key are preserved so that the primary database can contribute more than
# one merged result row for a given join-key value (e.g. two cities in the
# same state).  Secondary databases are treated as lookup tables: the caller
# uses the last element of the array for each key.
sub _fetch_indexed {
	my ($self, $db_idx, $criteria) = @_;

	my $db        = $self->{_dbs}[$db_idx];
	my $local_jc  = $self->{_join_map}{$db_idx} // $self->{_join_col};

	my $rows = $db->selectall_arrayref($criteria);
	$rows //= [];

	my %indexed;
	for my $row (@{$rows}) {
		my $key = $row->{$local_jc};
		next unless defined $key;
		push @{ $indexed{$key} }, $row;
	}

	return \%indexed;
}

# _joined_query( \%params ) -> \@merged_rows
#
# Core algorithm.  Criteria are routed per-database; the key set is then
# built using the following rules, applied sequentially for each database
# after the primary:
#
#   - If the database had criteria in this query, it acts as an INNER-JOIN
#     partner regardless of join_type: only keys present in its filtered
#     result survive into the key set.  This gives WHERE-clause semantics
#     (e.g. tier=>'gold' on a LEFT join still returns only the matching rows).
#
#   - If the database had NO criteria:
#       inner  -> intersect  (standard inner join)
#       left   -> no change  (primary defines the key set)
#       outer  -> union      (all keys from any database)
#
# Rows are merged by updating a %merged hash from each database in order,
# so later databases' values overwrite earlier ones for duplicate columns.
sub _joined_query {
	my ($self, $params) = @_;

	my $join_col  = $self->{_join_col};
	my $join_type = $self->{_join_type};
	my $n         = scalar @{ $self->{_dbs} };

	my $per_db = $self->_partition_criteria($params);

	# Fetch and index each database with its own criteria slice.
	my @indexed;
	my @had_criteria;
	for my $i (0 .. $n - 1) {
		$indexed[$i]     = $self->_fetch_indexed($i, $per_db->[$i]);
		$had_criteria[$i] = scalar keys %{ $per_db->[$i] } ? 1 : 0;
	}

	# Seed the key set from the primary database.
	my %key_set = map { $_ => 1 } keys %{ $indexed[0] };

	# Merge in each secondary database.
	for my $i (1 .. $n - 1) {
		my %sec_keys = map { $_ => 1 } keys %{ $indexed[$i] };

		if ($had_criteria[$i] || $join_type eq 'inner') {
			# Intersect: retain only keys present in this database's result.
			%key_set = map { $_ => 1 } grep { $sec_keys{$_} } keys %key_set;
		} elsif ($join_type eq 'outer') {
			# Union: add any keys from this database not yet in the set.
			$key_set{$_} = 1 for keys %sec_keys;
		}
		# left + no criteria: key_set unchanged (primary defines the set).
	}

	# Build one merged result row for every primary-database row that qualifies.
	# Secondary databases act as lookup tables: when a key maps to multiple
	# secondary rows, the last one wins (consistent with construction-time
	# last-database-wins column routing).
	my @result;
	my @removed = keys %{ $self->{_removed_cols} };
	for my $key (sort keys %key_set) {
		# All qualifying rows from the primary database for this key.
		# Use [{}] so that outer-join keys absent from the primary still
		# produce one merged row filled from secondary databases.
		my @base_rows = @{ $indexed[0]{$key} // [{}] };

		for my $prow (@base_rows) {
			my %merged = %{$prow};

			for my $i (1 .. $n - 1) {
				my $sec_arr = $indexed[$i]{$key};
				next unless $sec_arr && @{$sec_arr};
				my %row_copy = %{ $sec_arr->[-1] };  # last wins for secondaries
				my $local_jc = $self->{_join_map}{$i};
				if ($local_jc && $local_jc ne $join_col) {
					$row_copy{$join_col} = delete $row_copy{$local_jc};
				}
				%merged = (%merged, %row_copy);
			}

			delete @merged{@removed} if @removed;
			push @result, \%merged;
		}
	}

	carp _msg($self->{_i18n}, 'warn_empty_result')
		unless @result;

	return \@result;
}

# _msg( $i18n, $key, @sprintf_args ) -> $string
sub _msg {
	my ($i18n, $key, @args) = @_;

	if ($i18n && $i18n->can('translate')) {
		return $i18n->translate($key, @args);
	}

	my $fmt = $MESSAGES{$key}
		// sprintf($MESSAGES{error_unknown_message}, $key);

	return @args ? sprintf($fmt, @args) : $fmt;
}

1;

__END__

=head1 MESSAGES

All messages that the module can croak or carp, and how to resolve them.

=head3 MESSAGES

    Key                       | Trigger                            | Resolution
    --------------------------|------------------------------------|---------------------------------
    error_no_databases        | Empty databases arrayref           | Pass at least one D::A object
    error_invalid_db          | Element is not a D::A subclass     | Instantiate subclass first
    error_join_col_missing    | join_column absent from a database | Add the column or change join_column
    error_remove_join_col     | Attempt to remove join_column      | Remove a different column
    warn_unknown_column       | Criterion column not in any DB     | Check column name spelling
    warn_empty_result         | Join yields zero rows              | Relax criteria or check data
    error_query_unsupported   | query() called                     | Use selectall_arrayref instead
    error_execute_unsupported | execute() called                   | Use Perl-level query methods

=head1 REPOSITORY

L<https://github.com/nigelhorne/Database-Join>

=head1 SUPPORT

This module is provided as-is without any warranty.

=head1 AUTHOR

Nigel Horne, C<< <njh@nigelhorne.com> >>

=head1 FORMAL SPECIFICATION

=head2 new

    # new : seq DA_Object x String? x JoinType? x seq String? -> Database_Join
    # pre:  len databases >= 1
    #       forall db : databases | db.isa('Database::Abstraction')
    #       forall db : databases | join_column in db.columns
    #       join_column not in remove_columns
    # post: self._dbs          = databases
    #       self._join_col     = join_column
    #       self._join_type    = join_type
    #       self._removed_cols = set(remove_columns)
    #       self._col_db       = build_col_index(databases) \ remove_columns

=head2 selectall_arrayref

    # selectall_arrayref : CriteriaMap -> seq MergedRow
    # pre:  all criterion column names in dom self._col_db
    #       union { join_column }
    # post: result = join(
    #           forall i: query(self._dbs[i], criteria_for[i]),
    #           key    = self._join_col,
    #           type   = self._join_type )

=head2 fetchrow_hashref

    # fetchrow_hashref : CriteriaMap -> MergedRow?
    # post: result = selectall_arrayref(criteria)[0]

=head2 add_database

    # add_database : DA_Object x seq String? -> Database_Join
    # pre:  database.isa('Database::Abstraction')
    #       self._join_col in database.columns
    #       self._join_col not in remove_columns
    # post: self._dbs          = self._dbs ^ [database]
    #       self._col_db       = self._col_db ++ col_index(database) \ remove_columns
    #       self._removed_cols = self._removed_cols union set(remove_columns)

=head2 remove_column

    # remove_column : String -> Database_Join
    # pre:  col != self._join_col
    # post: self._removed_cols = self._removed_cols union {col}
    #       self._col_db       = self._col_db \ {col}
    #       self._col_cache    = undef
    #       self._schema_cache = undef

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2026 Nigel Horne.

Usage is subject to the GPL2 licence terms.
If you use it,
please let me know.

=cut
