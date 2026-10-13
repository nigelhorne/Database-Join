#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-10-13 23:27:28
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

################################################################
# FILE: lib/Database/Join.pm
################################################################
# --- SURVIVORS (TODO stubs) ---

# --- SURVIVOR: COND_INV_3288_5 (MEDIUM) line 3288 in _joined_query_array() ---
# Source:  if (defined $i && ref($idx) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3288_5 line 3288 in _joined_query_array()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3288 in _joined_query_array() to detect the mutant
    fail('COND_INV_3288_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3600_3 (MEDIUM) line 3600 in _build_sqlite_cache() ---
# Source:  if (do { local $@; eval { $db->can('dbi_source') } }) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3600_3 line 3600 in _build_sqlite_cache()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3600 in _build_sqlite_cache() to detect the mutant
    fail('COND_INV_3600_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3661_18_> (HIGH) line 3661 in _build_sqlite_cache() ---
# Source:  if (++$batch >= 1_000) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3661_18_> line 3661 in _build_sqlite_cache()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3661 in _build_sqlite_cache() to detect the mutant
    fail('NUM_BOUNDARY_3661_18_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3744_4 (MEDIUM) line 3744 in _sqlite_join() ---
# Source:  if (do { local $@; eval { $db->can('dbi_source') } }) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3744_4 line 3744 in _sqlite_join()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3744 in _sqlite_join() to detect the mutant
    fail('COND_INV_3744_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3923_38_< (HIGH) line 3923 in _sqlite_join() ---
# Source:  ? (($join_type eq 'outer' && $n > 1)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3923_38_< line 3923 in _sqlite_join()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3923 in _sqlite_join() to detect the mutant
    fail('NUM_BOUNDARY_3923_38_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4019_23_< (HIGH) line 4019 in _sqlite_where() ---
# Source:  my $local_jc_i = $i > 0 ? ($self->{_join_map}{$i} // $join_col) : undef;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4019_23_< line 4019 in _sqlite_where()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4019 in _sqlite_where() to detect the mutant
    fail('NUM_BOUNDARY_4019_23_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4161_45_> (HIGH) line 4161 in _validate_aggregate_spec() ---
# Source:  if ($col ne $join_col && index($col, '.') < 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4161_45_> line 4161 in _validate_aggregate_spec()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4161 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4161_45_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4327_5 (MEDIUM) line 4327 in _match_having_criterion() ---
# Source:  return 0 if $op eq 'IS NULL';   # value is defined
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4327_5 line 4327 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4327 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4327_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4332_6 (MEDIUM) line 4332 in _match_having_criterion() ---
# Source:  return 0 unless grep { defined $_ && $_ eq $value } @items;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4332_6 line 4332 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4332 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4332_6: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4334_6 (MEDIUM) line 4334 in _match_having_criterion() ---
# Source:  return 0 if grep { defined $_ && $_ eq $value } @items;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4334_6 line 4334 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4334 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4334_6: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4339_53_!= (HIGH) line 4339 in _match_having_criterion() ---
# Source:  if    ($op eq '=')        { $ok = $num ? $value == $rhs : $value eq $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4339_53_!= line 4339 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4339 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4339_53_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4340_53_== (HIGH) line 4340 in _match_having_criterion() ---
# Source:  elsif ($op eq '!=')       { $ok = $num ? $value != $rhs : $value ne $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4340_53_== line 4340 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4340 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4340_53_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4342_53_> (HIGH) line 4342 in _match_having_criterion() ---
# Source:  elsif ($op eq '<')        { $ok = $num ? $value < $rhs  : $value lt $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4342_53_> line 4342 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4342 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4342_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4343_53_> (HIGH) line 4343 in _match_having_criterion() ---
# Source:  elsif ($op eq '>=')       { $ok = $num ? $value >= $rhs : $value ge $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4343_53_> line 4343 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4343 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4343_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4344_53_< (HIGH) line 4344 in _match_having_criterion() ---
# Source:  elsif ($op eq '<=')       { $ok = $num ? $value <= $rhs : $value le $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4344_53_< line 4344 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4344 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4344_53_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4367_13_!= (HIGH) line 4367 in _match_having_criterion() ---
# Source:  ? ($value == $criterion ? 1 : 0)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4367_13_!= line 4367 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4367 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4367_13_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4415_4 (MEDIUM) line 4415 in _fold_aggregate() ---
# Source:  if    ($fn eq 'sum')            { $g{"${as}__sum"} = 0; $g{"${as}__bad"} = 0; $g{"${as}__badval"} = undef }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4415_4 line 4415 in _fold_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4415 in _fold_aggregate() to detect the mutant
    fail('COND_INV_4415_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4505_5 (MEDIUM) line 4505 in _fold_aggregate() ---
# Source:  if ($g->{"${as}__bad"} && !$bad_warned{$as}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4505_5 line 4505 in _fold_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4505 in _fold_aggregate() to detect the mutant
    fail('COND_INV_4505_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4541_4 (MEDIUM) line 4541 in _sort_and_page() ---
# Source:  if    (!defined $va && !defined $vb) { $cmp = 0 }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4541_4 line 4541 in _sort_and_page()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4541 in _sort_and_page() to detect the mutant
    fail('COND_INV_4541_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4556_5 (MEDIUM) line 4556 in _sort_and_page() ---
# Source:  if    (!defined $va && !defined $vb) { $cmp = 0 }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4556_5 line 4556 in _sort_and_page()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4556 in _sort_and_page() to detect the mutant
    fail('COND_INV_4556_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4685_36_< (HIGH) line 4685 in _sqlite_aggregate() ---
# Source:  if ($join_type eq 'outer' && $n > 1) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4685_36_< line 4685 in _sqlite_aggregate()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4685 in _sqlite_aggregate() to detect the mutant
    fail('NUM_BOUNDARY_4685_36_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4811_2 (MEDIUM) line 4811 in _mandatory_op_to_crit() ---
# Source:  return $val;  # unreachable: validated at construction
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4811_2 line 4811 in _mandatory_op_to_crit()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4811 in _mandatory_op_to_crit() to detect the mutant
    fail('BOOL_NEGATE_4811_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4824_3 (MEDIUM) line 4824 in _pass_mandatory_filters() ---
# Source:  return 0 unless defined $rv;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4824_3 line 4824 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4824 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_4824_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4827_31 (MEDIUM) line 4827 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lt')       { return 0 unless $rv lt $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4827_31 line 4827 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4827 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_4827_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4828_31 (MEDIUM) line 4828 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lte')      { return 0 unless $rv le $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4828_31 line 4828 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4828 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_4828_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4830_31 (MEDIUM) line 4830 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'gte')      { return 0 unless $rv ge $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4830_31 line 4830 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4830 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_4830_31: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4831_64_> (HIGH) line 4831 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'contains') { return 0 unless index($rv, $val) >= 0 }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4831_64_> line 4831 in _pass_mandatory_filters()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4831 in _pass_mandatory_filters() to detect the mutant
    fail('NUM_BOUNDARY_4831_64_>: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_4327_5 line 4327 in _match_having_criterion() ---
# Source:  return 0 if $op eq 'IS NULL';   # value is defined
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4327_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4332_6 line 4332 in _match_having_criterion() ---
# Source:  return 0 unless grep { defined $_ && $_ eq $value } @items;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4332_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4334_6 line 4334 in _match_having_criterion() ---
# Source:  return 0 if grep { defined $_ && $_ eq $value } @items;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4334_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4811_2 line 4811 in _mandatory_op_to_crit() ---
# Source:  return $val;  # unreachable: validated at construction
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4811_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4824_3 line 4824 in _pass_mandatory_filters() ---
# Source:  return 0 unless defined $rv;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4824_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4827_31 line 4827 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lt')       { return 0 unless $rv lt $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4827_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4828_31 line 4828 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lte')      { return 0 unless $rv le $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4828_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4830_31 line 4830 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'gte')      { return 0 unless $rv ge $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4830_31: add assertion here');

done_testing();
