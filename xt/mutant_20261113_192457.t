#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-11-13 19:24:57
# Generator: scripts/test-generator-index
#
# DO NOT COMMIT without completing the TODO sections.
#
# HIGH/MEDIUM difficulty survivors have TODO stubs — these need real tests.
# LOW difficulty survivors appear as comment hints — worth improving.
#
# Stubs call new() for modules with a constructor, or show a class method
# placeholder for modules without one. Add arguments as needed.

use strict;
use warnings;
use Test::More;

use_ok('Database::Join');
use_ok('Database::Join::Catalog');

################################################################
# FILE: lib/Database/Join.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_3575_5 (MEDIUM) line 3575 in _joined_query() ---
# Source:  #          non-integer, etc.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3575_5 line 3575 in _joined_query()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3575 in _joined_query() to detect the mutant
    fail('COND_INV_3575_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3891_3 (MEDIUM) line 3891 in _joined_query_array() ---
# Source:  # before sort and pagination, so they cannot be bypassed by caller criteria.
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3891_3 line 3891 in _joined_query_array()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3891 in _joined_query_array() to detect the mutant
    fail('COND_INV_3891_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3952_18_> (HIGH) line 3952 in _cache_fresh() ---
# Source:  return 0 if ($cache->{n} // 0) != $n;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3952_18_> line 3952 in _cache_fresh()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3952 in _cache_fresh() to detect the mutant
    fail('NUM_BOUNDARY_3952_18_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4035_4 (MEDIUM) line 4035 in _build_sqlite_cache() ---
# Source:  # Zero-copy ATTACH path: unconditionally available when the source
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4035_4 line 4035 in _build_sqlite_cache()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4035 in _build_sqlite_cache() to detect the mutant
    fail('COND_INV_4035_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4214_38_< (HIGH) line 4214 in _sqlite_join() ---
# Source:  $can_count = 0;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4214_38_< line 4214 in _sqlite_join()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4214 in _sqlite_join() to detect the mutant
    fail('NUM_BOUNDARY_4214_38_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4310_23_< (HIGH) line 4310 in _sqlite_join() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4310_23_< line 4310 in _sqlite_join()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4310 in _sqlite_join() to detect the mutant
    fail('NUM_BOUNDARY_4310_23_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4452_45_> (HIGH) line 4452 in _sqlite_where() ---
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4452_45_> line 4452 in _sqlite_where()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4452 in _sqlite_where() to detect the mutant
    fail('NUM_BOUNDARY_4452_45_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4618_5 (MEDIUM) line 4618 in _validate_aggregate_spec() ---
# Source:  $by_name_set{ $_->{name} } = 1 for @by_names;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4618_5 line 4618 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4618 in _validate_aggregate_spec() to detect the mutant
    fail('BOOL_NEGATE_4618_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4623_6 (MEDIUM) line 4623 in _validate_aggregate_spec() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4623_6 line 4623 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4623 in _validate_aggregate_spec() to detect the mutant
    fail('BOOL_NEGATE_4623_6: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4625_6 (MEDIUM) line 4625 in _validate_aggregate_spec() ---
# Source:  croak $self->_err('error_aggregate_fn_unknown', $m->{fn} // '')
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4625_6 line 4625 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4625 in _validate_aggregate_spec() to detect the mutant
    fail('BOOL_NEGATE_4625_6: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4630_53_!= (HIGH) line 4630 in _validate_aggregate_spec() ---
# Source:  if (defined $col) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4630_53_!= line 4630 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4630 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4630_53_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4631_53_== (HIGH) line 4631 in _validate_aggregate_spec() ---
# Source:  my $col_owner = $self->{_col_db}{$col};
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4631_53_== line 4631 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4631 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4631_53_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4633_53_> (HIGH) line 4633 in _validate_aggregate_spec() ---
# Source:  unless defined $col_owner;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4633_53_> line 4633 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4633 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4633_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4634_53_> (HIGH) line 4634 in _validate_aggregate_spec() ---
# Source:  if ($col ne $join_col && index($col, '.') < 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4634_53_> line 4634 in _validate_aggregate_spec()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4634 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4634_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4635_53_< (HIGH) line 4635 in _validate_aggregate_spec() ---
# Source:  for my $j (0 .. $n - 1) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4635_53_< line 4635 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4635 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4635_53_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4658_13_!= (HIGH) line 4658 in _validate_aggregate_spec() ---
# Source:  unless $as =~ /^\w+\z/;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4658_13_!= line 4658 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4658 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4658_13_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4706_4 (MEDIUM) line 4706 in _validate_aggregate_spec() ---
# Source:  having   => $having_raw,
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4706_4 line 4706 in _validate_aggregate_spec()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4706 in _validate_aggregate_spec() to detect the mutant
    fail('COND_INV_4706_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4796_5 (MEDIUM) line 4796 in _match_having_criterion() ---
# Source:  }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4796_5 line 4796 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4796 in _match_having_criterion() to detect the mutant
    fail('COND_INV_4796_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4832_4 (MEDIUM) line 4832 in _match_criteria() ---
# Source:  return 1;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4832_4 line 4832 in _match_criteria()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4832 in _match_criteria() to detect the mutant
    fail('COND_INV_4832_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4847_5 (MEDIUM) line 4847 in _fold_aggregate() ---
# Source:  my %g;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4847_5 line 4847 in _fold_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4847 in _fold_aggregate() to detect the mutant
    fail('COND_INV_4847_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4976_36_< (HIGH) line 4976 in _sort_and_page() ---
# Source:  my ($sc, $sd) = @{$sort};
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4976_36_< line 4976 in _sort_and_page()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4976 in _sort_and_page() to detect the mutant
    fail('NUM_BOUNDARY_4976_36_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5102_2 (MEDIUM) line 5102 in _sqlite_aggregate() ---
# Source:  $self->_build_sqlite_cache() unless $self->_cache_fresh();
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5102_2 line 5102 in _sqlite_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5102 in _sqlite_aggregate() to detect the mutant
    fail('BOOL_NEGATE_5102_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5115_3 (MEDIUM) line 5115 in _sqlite_aggregate() ---
# Source:  # Build by-column expressions (GROUP BY / SELECT / ORDER BY).
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5115_3 line 5115 in _sqlite_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5115 in _sqlite_aggregate() to detect the mutant
    fail('BOOL_NEGATE_5115_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5118_31 (MEDIUM) line 5118 in _sqlite_aggregate() ---
# Source:  my %have_map;   # key => { expr, is_agg } for _having_to_sql
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5118_31 line 5118 in _sqlite_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5118 in _sqlite_aggregate() to detect the mutant
    fail('BOOL_NEGATE_5118_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5119_31 (MEDIUM) line 5119 in _sqlite_aggregate() ---
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5119_31 line 5119 in _sqlite_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5119 in _sqlite_aggregate() to detect the mutant
    fail('BOOL_NEGATE_5119_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5121_31 (MEDIUM) line 5121 in _sqlite_aggregate() ---
# Source:  my ($bname, $owner, $db_col) = @{$b}{qw(name owner db_col)};
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5121_31 line 5121 in _sqlite_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5121 in _sqlite_aggregate() to detect the mutant
    fail('BOOL_NEGATE_5121_31: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_5122_64_> (HIGH) line 5122 in _sqlite_aggregate() ---
# Source:  my $expr;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_5122_64_> line 5122 in _sqlite_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5122 in _sqlite_aggregate() to detect the mutant
    fail('NUM_BOUNDARY_5122_64_>: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_4618_5 line 4618 in _validate_aggregate_spec() ---
# Source:  $by_name_set{ $_->{name} } = 1 for @by_names;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4618_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4623_6 line 4623 in _validate_aggregate_spec() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4623_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4625_6 line 4625 in _validate_aggregate_spec() ---
# Source:  croak $self->_err('error_aggregate_fn_unknown', $m->{fn} // '')
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4625_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5102_2 line 5102 in _sqlite_aggregate() ---
# Source:  $self->_build_sqlite_cache() unless $self->_cache_fresh();
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5102_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5115_3 line 5115 in _sqlite_aggregate() ---
# Source:  # Build by-column expressions (GROUP BY / SELECT / ORDER BY).
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5115_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5118_31 line 5118 in _sqlite_aggregate() ---
# Source:  my %have_map;   # key => { expr, is_agg } for _having_to_sql
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5118_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5119_31 line 5119 in _sqlite_aggregate() ---
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5119_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5121_31 line 5121 in _sqlite_aggregate() ---
# Source:  my ($bname, $owner, $db_col) = @{$b}{qw(name owner db_col)};
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5121_31: add assertion here');

################################################################
# FILE: lib/Database/Join/Catalog.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: BOOL_NEGATE_283_15 (MEDIUM) line 283 in message() ---
# Source:  sub message { return $_[0]->{message} }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_283_15 line 283 in message()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join::Catalog requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join::Catalog');
    # TODO: exercise line 283 in message() to detect the mutant
    fail('BOOL_NEGATE_283_15: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_283_15 line 283 in message() ---
# Source:  sub message { return $_[0]->{message} }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join::Catalog requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join::Catalog');
# ok($obj->..., 'RETURN_UNDEF_283_15: add assertion here');

done_testing();
