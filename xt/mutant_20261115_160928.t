#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-11-15 16:09:28
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

# --- SURVIVOR: NUM_BOUNDARY_3510_21_< (HIGH) line 3510 in _pushdown_criteria() ---
# Source:  if (@keys && @keys <= $MAX_PUSHDOWN_KEYS) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3510_21_< line 3510 in _pushdown_criteria()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3510 in _pushdown_criteria() to detect the mutant
    fail('NUM_BOUNDARY_3510_21_<: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3738_5 (MEDIUM) line 3738 in _joined_query_array() ---
# Source:  if (defined $i && ref($idx) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3738_5 line 3738 in _joined_query_array()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3738 in _joined_query_array() to detect the mutant
    fail('COND_INV_3738_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4056_3 (MEDIUM) line 4056 in _build_sqlite_cache() ---
# Source:  if (do { local $@; eval { $db->can('dbi_source') } }) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4056_3 line 4056 in _build_sqlite_cache()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4056 in _build_sqlite_cache() to detect the mutant
    fail('COND_INV_4056_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4117_18_> (HIGH) line 4117 in _build_sqlite_cache() ---
# Source:  if (++$batch >= 1_000) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4117_18_> line 4117 in _build_sqlite_cache()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4117 in _build_sqlite_cache() to detect the mutant
    fail('NUM_BOUNDARY_4117_18_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4200_4 (MEDIUM) line 4200 in _sqlite_join() ---
# Source:  if (do { local $@; eval { $db->can('dbi_source') } }) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4200_4 line 4200 in _sqlite_join()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4200 in _sqlite_join() to detect the mutant
    fail('COND_INV_4200_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4379_38_< (HIGH) line 4379 in _sqlite_join() ---
# Source:  ? (($join_type eq 'outer' && $n > 1)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4379_38_< line 4379 in _sqlite_join()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4379 in _sqlite_join() to detect the mutant
    fail('NUM_BOUNDARY_4379_38_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4478_23_< (HIGH) line 4478 in _sqlite_where() ---
# Source:  my $local_jc_i = $i > 0 ? ($self->{_join_map}{$i} // $join_col) : undef;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4478_23_< line 4478 in _sqlite_where()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4478 in _sqlite_where() to detect the mutant
    fail('NUM_BOUNDARY_4478_23_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4620_45_> (HIGH) line 4620 in _validate_aggregate_spec() ---
# Source:  if ($col ne $join_col && index($col, '.') < 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4620_45_> line 4620 in _validate_aggregate_spec()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4620 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4620_45_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4786_5 (MEDIUM) line 4786 in _match_having_criterion() ---
# Source:  return 0 if $op eq 'IS NULL';   # value is defined
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4786_5 line 4786 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4786 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4786_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4791_6 (MEDIUM) line 4791 in _match_having_criterion() ---
# Source:  return 0 unless grep { defined $_ && $_ eq $value } @items;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4791_6 line 4791 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4791 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4791_6: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4793_6 (MEDIUM) line 4793 in _match_having_criterion() ---
# Source:  return 0 if grep { defined $_ && $_ eq $value } @items;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4793_6 line 4793 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4793 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4793_6: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4798_53_!= (HIGH) line 4798 in _match_having_criterion() ---
# Source:  if    ($op eq '=')        { $ok = $num ? $value == $rhs : $value eq $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4798_53_!= line 4798 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4798 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4798_53_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4799_53_== (HIGH) line 4799 in _match_having_criterion() ---
# Source:  elsif ($op eq '!=')       { $ok = $num ? $value != $rhs : $value ne $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4799_53_== line 4799 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4799 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4799_53_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4801_53_> (HIGH) line 4801 in _match_having_criterion() ---
# Source:  elsif ($op eq '<')        { $ok = $num ? $value < $rhs  : $value lt $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4801_53_> line 4801 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4801 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4801_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4802_53_> (HIGH) line 4802 in _match_having_criterion() ---
# Source:  elsif ($op eq '>=')       { $ok = $num ? $value >= $rhs : $value ge $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4802_53_> line 4802 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4802 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4802_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4803_53_< (HIGH) line 4803 in _match_having_criterion() ---
# Source:  elsif ($op eq '<=')       { $ok = $num ? $value <= $rhs : $value le $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4803_53_< line 4803 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4803 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4803_53_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4826_13_!= (HIGH) line 4826 in _match_having_criterion() ---
# Source:  ? ($value == $criterion ? 1 : 0)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4826_13_!= line 4826 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4826 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4826_13_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4874_4 (MEDIUM) line 4874 in _fold_aggregate() ---
# Source:  if    ($fn eq 'sum')            { $g{"${as}__sum"} = 0; $g{"${as}__bad"} = 0; $g{"${as}__badval"} = undef }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4874_4 line 4874 in _fold_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4874 in _fold_aggregate() to detect the mutant
    fail('COND_INV_4874_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4964_5 (MEDIUM) line 4964 in _fold_aggregate() ---
# Source:  if ($g->{"${as}__bad"} && !$bad_warned{$as}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4964_5 line 4964 in _fold_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4964 in _fold_aggregate() to detect the mutant
    fail('COND_INV_4964_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_5000_4 (MEDIUM) line 5000 in _sort_and_page() ---
# Source:  if    (!defined $va && !defined $vb) { $cmp = 0 }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_5000_4 line 5000 in _sort_and_page()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5000 in _sort_and_page() to detect the mutant
    fail('COND_INV_5000_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_5015_5 (MEDIUM) line 5015 in _sort_and_page() ---
# Source:  if    (!defined $va && !defined $vb) { $cmp = 0 }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_5015_5 line 5015 in _sort_and_page()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5015 in _sort_and_page() to detect the mutant
    fail('COND_INV_5015_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_5144_36_< (HIGH) line 5144 in _sqlite_aggregate() ---
# Source:  if ($join_type eq 'outer' && $n > 1) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_5144_36_< line 5144 in _sqlite_aggregate()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5144 in _sqlite_aggregate() to detect the mutant
    fail('NUM_BOUNDARY_5144_36_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5270_2 (MEDIUM) line 5270 in _mandatory_op_to_crit() ---
# Source:  return $val;  # unreachable: validated at construction
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5270_2 line 5270 in _mandatory_op_to_crit()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5270 in _mandatory_op_to_crit() to detect the mutant
    fail('BOOL_NEGATE_5270_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5283_3 (MEDIUM) line 5283 in _pass_mandatory_filters() ---
# Source:  return 0 unless defined $rv;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5283_3 line 5283 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5283 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5283_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5286_31 (MEDIUM) line 5286 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lt')       { return 0 unless $rv lt $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5286_31 line 5286 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5286 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5286_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5287_31 (MEDIUM) line 5287 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lte')      { return 0 unless $rv le $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5287_31 line 5287 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5287 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5287_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5289_31 (MEDIUM) line 5289 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'gte')      { return 0 unless $rv ge $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5289_31 line 5289 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5289 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5289_31: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_5290_64_> (HIGH) line 5290 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'contains') { return 0 unless index($rv, $val) >= 0 }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_5290_64_> line 5290 in _pass_mandatory_filters()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5290 in _pass_mandatory_filters() to detect the mutant
    fail('NUM_BOUNDARY_5290_64_>: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_4786_5 line 4786 in _match_having_criterion() ---
# Source:  return 0 if $op eq 'IS NULL';   # value is defined
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4786_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4791_6 line 4791 in _match_having_criterion() ---
# Source:  return 0 unless grep { defined $_ && $_ eq $value } @items;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4791_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4793_6 line 4793 in _match_having_criterion() ---
# Source:  return 0 if grep { defined $_ && $_ eq $value } @items;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4793_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5270_2 line 5270 in _mandatory_op_to_crit() ---
# Source:  return $val;  # unreachable: validated at construction
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5270_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5283_3 line 5283 in _pass_mandatory_filters() ---
# Source:  return 0 unless defined $rv;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5283_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5286_31 line 5286 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lt')       { return 0 unless $rv lt $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5286_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5287_31 line 5287 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lte')      { return 0 unless $rv le $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5287_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5289_31 line 5289 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'gte')      { return 0 unless $rv ge $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5289_31: add assertion here');

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
