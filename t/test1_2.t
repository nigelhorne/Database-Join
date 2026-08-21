#!perl -w

use strict;
use FindBin qw($Bin);

use File::Spec;
use Test::Most tests => 28;
use Test::NoWarnings;

use lib 't/lib';
use Database::test1;
use Database::test2;
use Database::Join;

# ---------------------------------------------------------------------------
# Fixtures
#
#   test1 (PSV): entry (city) | statecode
#       Richmond      VA
#       Silver Spring MD
#       Laurel        MD
#
#   test2 (PSV): entry (statecode) | state
#       MD  Maryland
#       VA  Virginia
#
#  The join key is test1.statecode = test2.entry.
#  join_column => 'statecode', join_map => { 1 => 'entry' }.
#
#  Expected result (3 rows, sorted by statecode):
#    { statecode=>'MD', entry=>'Silver Spring', state=>'Maryland' }
#    { statecode=>'MD', entry=>'Laurel',        state=>'Maryland' }
#    { statecode=>'VA', entry=>'Richmond',      state=>'Virginia' }
#  (The two MD rows are in non-deterministic order.)
# ---------------------------------------------------------------------------

my $directory = File::Spec->catfile($Bin, File::Spec->updir(), 't', 'data');
my $test1 = new_ok('Database::test1' => [$directory]);
my $test2 = new_ok('Database::test2' => [$directory]);

my $joined;
lives_ok {
	$joined = Database::Join->new(
		databases   => [ $test1, $test2 ],
		join_column => 'statecode',
		join_map    => { 1 => 'entry' },
	);
} 'Database::Join->new with join_map lives';

isa_ok($joined, 'Database::Join', 'result is a Database::Join');

# columns(): test2's local 'entry' (join alias) must not appear as a
# separate column; only the canonical 'statecode' is exposed.
is_deeply(
	$joined->columns(),
	[qw(entry state statecode)],
	'columns() has entry (from test1), state (test2), statecode (join key)'
);

my $rows = $joined->selectall_arrayref();

# diag(Data::Dumper->new([$rows])->Dump());
cmp_ok($joined->state('Laurel'), 'eq', 'Maryland');

# Each city appears in its own merged row — no city is lost.
is(scalar @{$rows}, 3, 'one merged row per city (primary-db row)');

# Results are sorted by join_column (statecode): MD before VA.
is($rows->[0]{statecode}, 'MD',       'row 0: statecode is MD');
is($rows->[0]{state},     'Maryland', 'row 0: state is Maryland (from test2)');
is($rows->[1]{statecode}, 'MD',       'row 1: statecode is MD');
is($rows->[1]{state},     'Maryland', 'row 1: state is Maryland (from test2)');

# Both MD cities must be present; order within the same statecode is unspecified.
my %md_cities = map { $_->{entry} => 1 } grep { $_->{statecode} eq 'MD' } @{$rows};
is_deeply(\%md_cities, { Laurel => 1, 'Silver Spring' => 1 },
	'both MD cities present in the merged result');

is($rows->[2]{statecode}, 'VA',       'row 2: statecode is VA');
is($rows->[2]{state},     'Virginia', 'row 2: state is Virginia (from test2)');
is($rows->[2]{entry},     'Richmond', 'row 2: only one VA city so entry is deterministic');

# count()
is($joined->count(),                  3, 'count() without criteria is 3');
is($joined->count(state => 'Virginia'), 1, 'count() on secondary column works');

# Criteria on the canonical join column
my $va_rows = $joined->selectall_arrayref(statecode => 'VA');
is(scalar @{$va_rows},     1,          'selectall_arrayref on join column narrows to 1');
is($va_rows->[0]{state},   'Virginia', 'join-column criteria returns correct state');
is($va_rows->[0]{entry},   'Richmond', 'join-column criteria returns correct city');

# Criteria on a column owned by test2
my $md_rows = $joined->selectall_arrayref(state => 'Maryland');
is(scalar @{$md_rows},     2,          'selectall_arrayref on test2 column returns both MD cities');

# fetchrow_hashref
my $row = $joined->fetchrow_hashref(statecode => 'VA');
is($row->{state},  'Virginia', 'fetchrow_hashref: correct state for VA');
is($row->{entry},  'Richmond', 'fetchrow_hashref: correct city for VA');

# AUTOLOAD with join_map: positional arg is treated as test1's 'entry' (city name)
is($joined->state('Laurel'),   'Maryland', 'AUTOLOAD state for Laurel is Maryland');
is($joined->state('Richmond'), 'Virginia', 'AUTOLOAD state for Richmond is Virginia');

# ---------------------------------------------------------------------------
# add_database with join_column — equivalent to using join_map in the constructor
# ---------------------------------------------------------------------------

my $joined2 = Database::Join->new(
	databases   => [ $test1 ],
	join_column => 'statecode',
);
lives_ok {
	$joined2->add_database($test2, join_column => 'entry');
} 'add_database with join_column lives';

is(scalar @{ $joined2->selectall_arrayref() }, 3,
	'add_database(join_column) also returns 3 rows');
