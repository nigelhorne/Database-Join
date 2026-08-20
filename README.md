# NAME

Database::Join - Combined view across two or more Database::Abstraction databases

# VERSION

Version 0.01

# SYNOPSIS

    use Database::Join;

    # Each object is an already-instantiated Database::Abstraction subclass
    my $customers = Database::Customers->new(directory => '/data');
    my $loyalty   = Database::Loyalty->new(directory  => '/data');

    my $join = Database::Join->new(
        databases      => [ $customers, $loyalty ],
        join_column    => 'entry',              # shared key column (default: 'entry')
        remove_columns => [ 'email', 'notes' ], # columns to hide (optional)
    );

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

# DESCRIPTION

`Database::Join` merges two or more [Database::Abstraction](https://metacpan.org/pod/Database%3A%3AAbstraction) objects into a
single logical view.  Each component database is queried independently through
its own `Database::Abstraction` interface; the results are then combined
in Perl memory using a shared key column (`join_column`).

The module exposes the same read-only API as `Database::Abstraction`:
`selectall_arrayref`, `selectall_array`, `fetchrow_hashref`, `count`,
`columns`, `schema`, `updated`, and the `AUTOLOAD` column shortcut.

## Join semantics

The `join_type` parameter controls what happens when a key value exists in
some databases but not all:

- `left` (default)

    All rows from the _primary_ (first) database are returned.  Columns from
    subsequent databases are filled in where a matching row is found and omitted
    where there is no match.

- `inner`

    Only rows whose join-column value is present in _every_ component database
    are returned.

- `outer`

    Every join-column value found in _any_ database is returned.  Missing columns
    from databases that lack that key are simply absent from the merged row.

## Column ownership

At construction time `Database::Join` calls `columns()` on each database to
build an internal column-to-database index.  When criteria are passed to a
query method, each criterion is routed to the database that owns the column.

The `join_column` itself is treated specially: criteria on it are broadcast
to _all_ databases so that each database fetches only the relevant rows.

When the same non-join column name exists in more than one database, the
_last_ database's value overwrites earlier ones in merged rows.

# LIMITATIONS

- In-memory join only.  Not suitable for very large result sets.
- The `query()` chained builder and `execute()` raw SQL are not supported.
- Only equi-joins on a single shared column are implemented.
- Sorting is performed on the `join_column` value only.  Per-column `ORDER BY`
from the caller is not propagated.

# METHODS

## new

### SYNOPSIS

    my $join = Database::Join->new(
        databases      => [ $db1, $db2 ],          # required
        join_column    => 'entry',                  # optional, default 'entry'
        join_type      => 'left',                   # optional, default 'left'
        remove_columns => [ 'email', 'internal_id' ], # optional
        logger         => $log,                     # optional
        i18n           => $locale,                  # optional
    );

### DESCRIPTION

Constructs and returns a new `Database::Join` object.  Each element of
`databases` must be an instantiated subclass of `Database::Abstraction`.
The `join_column` must be present in all component databases.

Columns listed in `remove_columns` are hidden from the merged view: they
do not appear in `columns()`, `schema()`, or any returned row hashref,
and criteria that reference them are silently dropped.  This is equivalent
to calling `remove_column` once per name after construction.

### API SPECIFICATION

#### Input

    databases      => { type => 'arrayref', required => 1 }
    join_column    => { type => 'string',   optional => 1, default => 'entry' }
    join_type      => { type => 'string',   optional => 1, default => 'left',
                        enum => ['inner','left','outer'] }
    remove_columns => { type => 'arrayref', optional => 1 }
    logger         => { type => 'object',   optional => 1 }
    i18n           => { type => 'object',   optional => 1 }

#### Output

    Database::Join blessed object reference.

### FORMAL SPECIFICATION

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

## selectall\_arrayref

### SYNOPSIS

    my $rows = $join->selectall_arrayref();
    my $rows = $join->selectall_arrayref(tier  => 'gold');
    my $rows = $join->selectall_arrayref(score => { '>' => 80 });
    my $rows = $join->selectall_arrayref(entry => 'C001');

### DESCRIPTION

Returns an arrayref of hashrefs representing the merged view of all component
databases, filtered by any supplied criteria.  Criteria for columns that exist
in different databases are partitioned and evaluated independently; results are
joined in memory on `join_column`.

Accepts the same criteria syntax as `Database::Abstraction::selectall_arrayref`.

### API SPECIFICATION

#### Input

    Criteria: any flat key-value pairs accepted by Database::Abstraction,
    where keys are column names and values are plain scalars, comparison
    hashrefs, or set operators.  The join_column may be passed positionally
    when it is the sole argument and equals 'entry'.

#### Output

    Arrayref of hashrefs, one per unique join_column value, sorted
    ascending by join_column.

### FORMAL SPECIFICATION

    # selectall_arrayref : CriteriaMap -> seq MergedRow
    # pre:  all criterion column names in dom self._col_db
    #       union { join_column }
    # post: result = join(
    #           forall i: query(self._dbs[i], criteria_for[i]),
    #           key    = self._join_col,
    #           type   = self._join_type )

## selectall\_array

### SYNOPSIS

    my @rows = $join->selectall_array(status => 'active');

    # Scalar context applies LIMIT 1 (first match only)
    my $row  = $join->selectall_array(entry => 'C001');

### DESCRIPTION

In list context returns a list of hashrefs (same rows as `selectall_arrayref`).
In scalar context applies an implicit limit and returns only the first match.

### API SPECIFICATION

#### Input

    Same criteria syntax as selectall_arrayref.

#### Output

    List context:   list of hashrefs.
    Scalar context: single hashref or undef.

## fetchrow\_hashref

### SYNOPSIS

    my $row = $join->fetchrow_hashref(entry => 'C001');
    my $row = $join->fetchrow_hashref('C001');   # when join_column is 'entry'

### DESCRIPTION

Returns a single merged hashref for the first row matching the criteria,
or `undef` when there is no match.  Equivalent to calling
`selectall_arrayref` and taking the first element.

Accepts the same criteria as `selectall_arrayref`.

### API SPECIFICATION

#### Input

    Same criteria syntax as selectall_arrayref.

#### Output

    Hashref, or undef.

### FORMAL SPECIFICATION

    # fetchrow_hashref : CriteriaMap -> MergedRow?
    # post: result = selectall_arrayref(criteria)[0]

## count

### SYNOPSIS

    my $total  = $join->count();
    my $active = $join->count(tier => 'gold');

### DESCRIPTION

Returns the number of merged rows that satisfy the given criteria.
Implemented by running the full join and counting the result; use with care
on large datasets.

### API SPECIFICATION

#### Input

    Same criteria syntax as selectall_arrayref.

#### Output

    Non-negative integer.

## columns

### SYNOPSIS

    my $cols = $join->columns();

### DESCRIPTION

Returns an arrayref of all column names present across all component
databases, deduplicated and sorted alphabetically.  The `join_column`
appears exactly once regardless of how many databases contain it.

### API SPECIFICATION

#### Input

    None.

#### Output

    Arrayref of column name strings.

## schema

### SYNOPSIS

    my $schema = $join->schema();

### DESCRIPTION

Returns a merged schema hashref for all columns across all component
databases.  Each key is a column name; each value follows the
`Database::Abstraction::schema()` contract:
`{ type, nullable, default, pk }`.

When the same column name appears in more than one database the _last_
database's metadata is used.

### API SPECIFICATION

#### Input

    None.

#### Output

    Hashref: column_name => { type, nullable, default, pk }.

## updated

### SYNOPSIS

    my $ts = $join->updated();

### DESCRIPTION

Returns the Unix timestamp of the most recent update across all component
databases (i.e. the maximum of all individual `updated()` return values).

### API SPECIFICATION

#### Input

    None.

#### Output

    Unix timestamp (integer).

## set\_logger

### SYNOPSIS

    $join->set_logger($log);

### DESCRIPTION

Propagates a new logger object to all component databases and stores it
locally for `Database::Join`'s own diagnostic output.

### API SPECIFICATION

#### Input

    $log    Positional: a logger object (required)

#### Output

    Returns $self for chaining.

## add\_database

### SYNOPSIS

    $join->add_database($db);
    $join->add_database($db, remove_columns => ['email']);
    $join->add_database(database => $db);

    # Chainable
    $join->add_database($db1)->add_database($db2, remove_columns => ['notes']);

### DESCRIPTION

Adds one more [Database::Abstraction](https://metacpan.org/pod/Database%3A%3AAbstraction) subclass object to the logical view
and updates the column ownership index.

The `join_column` must be present in the new database.  After the call,
rows returned by any query method include columns from the newly added
database, and criteria on those columns are routed to it.  When a column
name already exists in an earlier database, the new database becomes the
authoritative source (last-database-wins, the same rule applied at
construction time).

The method mirrors the parameter conventions of `new`:

- Positional: `$join->add_database($db)`
- Named: `$join->add_database(database => $db)`
- Named with options: `$join->add_database($db, remove_columns => [...])`

An optional `remove_columns` list hides specific columns from the newly
added database in exactly the same way as calling `remove_column` for each.

The logger is propagated to the new database if one was set on the join.

### API SPECIFICATION

#### Input

    database       => { type => 'object',   required => 1 }
    remove_columns => { type => 'arrayref', optional => 1 }

#### Output

    Returns C<$self> to support method chaining.

### FORMAL SPECIFICATION

    # add_database : DA_Object x seq String? -> Database_Join
    # pre:  database.isa('Database::Abstraction')
    #       self._join_col in database.columns
    #       self._join_col not in remove_columns
    # post: self._dbs          = self._dbs ^ [database]
    #       self._col_db       = self._col_db ++ col_index(database) \ remove_columns
    #       self._removed_cols = self._removed_cols union set(remove_columns)

## remove\_column

### SYNOPSIS

    $join->remove_column('email');
    $join->remove_column('internal_id')->remove_column('audit_ts');  # chainable

### DESCRIPTION

Hides a column from the merged view.  After calling this method:

- The column is absent from `columns()` and `schema()`.
- Returned row hashrefs no longer contain the column key.
- Criteria referencing the column are dropped with a `carp` warning (the
same behaviour as querying by a column that was never present).

Removing the `join_column` is not permitted and will `croak`.
Removing a column that does not exist in any database is silently ignored
(idempotent).  The `columns()` and `schema()` memoisation caches are
cleared automatically.

### API SPECIFICATION

#### Input

    $col    Positional string: the column name to remove (required)

#### Output

    Returns C<$self> to support method chaining.

### FORMAL SPECIFICATION

    # remove_column : String -> Database_Join
    # pre:  col != self._join_col
    # post: self._removed_cols = self._removed_cols union {col}
    #       self._col_db       = self._col_db \ {col}
    #       self._col_cache    = undef
    #       self._schema_cache = undef

## query

Not supported.  `Database::Join` does not implement the chained query
builder.  Use `selectall_arrayref` or `fetchrow_hashref` directly.

## execute

Not supported.  Raw SQL cannot be executed across heterogeneous backends.
Use the Perl-level query methods instead.

## AUTOLOAD - column shortcut

Calling an unknown method whose name matches a column name performs a
column lookup, delegated to whichever component database owns that column.

    my $name = $join->name(entry => 'C001');
    my @tiers = $join->tier();

# MESSAGES

All messages that the module can croak or carp, and how to resolve them.

### MESSAGES

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

# AUTHOR

Nigel Horne, `<nigel.horne@gmail.com>`

# LICENSE AND COPYRIGHT

Copyright (C) 2026 Nigel Horne.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
