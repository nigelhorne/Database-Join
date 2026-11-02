#!/usr/bin/env perl
# Auto-generated mutant test stubs
# Generated: 2026-11-02 01:45:42
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

# --- SURVIVOR: COND_INV_3574_5 (MEDIUM) line 3574 in _joined_query_array() ---
# Source:  if (defined $i && ref($idx) eq 'HASH') {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3574_5 line 3574 in _joined_query_array()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3574 in _joined_query_array() to detect the mutant
    fail('COND_INV_3574_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_3890_3 (MEDIUM) line 3890 in _build_sqlite_cache() ---
# Source:  if (do { local $@; eval { $db->can('dbi_source') } }) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_3890_3 line 3890 in _build_sqlite_cache()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3890 in _build_sqlite_cache() to detect the mutant
    fail('COND_INV_3890_3: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_3951_18_> (HIGH) line 3951 in _build_sqlite_cache() ---
# Source:  if (++$batch >= 1_000) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_3951_18_> line 3951 in _build_sqlite_cache()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 3951 in _build_sqlite_cache() to detect the mutant
    fail('NUM_BOUNDARY_3951_18_>: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4034_4 (MEDIUM) line 4034 in _sqlite_join() ---
# Source:  if (do { local $@; eval { $db->can('dbi_source') } }) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4034_4 line 4034 in _sqlite_join()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4034 in _sqlite_join() to detect the mutant
    fail('COND_INV_4034_4: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4213_38_< (HIGH) line 4213 in _sqlite_join() ---
# Source:  ? (($join_type eq 'outer' && $n > 1)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4213_38_< line 4213 in _sqlite_join()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4213 in _sqlite_join() to detect the mutant
    fail('NUM_BOUNDARY_4213_38_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4309_23_< (HIGH) line 4309 in _sqlite_where() ---
# Source:  my $local_jc_i = $i > 0 ? ($self->{_join_map}{$i} // $join_col) : undef;
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4309_23_< line 4309 in _sqlite_where()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4309 in _sqlite_where() to detect the mutant
    fail('NUM_BOUNDARY_4309_23_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4451_45_> (HIGH) line 4451 in _validate_aggregate_spec() ---
# Source:  if ($col ne $join_col && index($col, '.') < 0) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4451_45_> line 4451 in _validate_aggregate_spec()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4451 in _validate_aggregate_spec() to detect the mutant
    fail('NUM_BOUNDARY_4451_45_>: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4617_5 (MEDIUM) line 4617 in _match_having_criterion() ---
# Source:  return 0 if $op eq 'IS NULL';   # value is defined
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4617_5 line 4617 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4617 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4617_5: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4622_6 (MEDIUM) line 4622 in _match_having_criterion() ---
# Source:  return 0 unless grep { defined $_ && $_ eq $value } @items;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4622_6 line 4622 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4622 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4622_6: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_4624_6 (MEDIUM) line 4624 in _match_having_criterion() ---
# Source:  return 0 if grep { defined $_ && $_ eq $value } @items;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_4624_6 line 4624 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4624 in _match_having_criterion() to detect the mutant
    fail('BOOL_NEGATE_4624_6: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4629_53_!= (HIGH) line 4629 in _match_having_criterion() ---
# Source:  if    ($op eq '=')        { $ok = $num ? $value == $rhs : $value eq $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4629_53_!= line 4629 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4629 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4629_53_!=: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4630_53_== (HIGH) line 4630 in _match_having_criterion() ---
# Source:  elsif ($op eq '!=')       { $ok = $num ? $value != $rhs : $value ne $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip != to ==
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4630_53_== line 4630 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4630 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4630_53_==: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4632_53_> (HIGH) line 4632 in _match_having_criterion() ---
# Source:  elsif ($op eq '<')        { $ok = $num ? $value < $rhs  : $value lt $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip < to >
#   Numeric boundary flip < to <=
#   Numeric boundary flip < to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4632_53_> line 4632 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4632 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4632_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4633_53_> (HIGH) line 4633 in _match_having_criterion() ---
# Source:  elsif ($op eq '>=')       { $ok = $num ? $value >= $rhs : $value ge $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4633_53_> line 4633 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4633 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4633_53_>: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4634_53_< (HIGH) line 4634 in _match_having_criterion() ---
# Source:  elsif ($op eq '<=')       { $ok = $num ? $value <= $rhs : $value le $rhs }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip <= to <
#   Numeric boundary flip <= to >
#   Numeric boundary flip <= to >=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4634_53_< line 4634 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4634 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4634_53_<: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4657_13_!= (HIGH) line 4657 in _match_having_criterion() ---
# Source:  ? ($value == $criterion ? 1 : 0)
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (1 variant):
#   Numeric boundary flip == to !=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4657_13_!= line 4657 in _match_having_criterion()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4657 in _match_having_criterion() to detect the mutant
    fail('NUM_BOUNDARY_4657_13_!=: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4705_4 (MEDIUM) line 4705 in _fold_aggregate() ---
# Source:  if    ($fn eq 'sum')            { $g{"${as}__sum"} = 0; $g{"${as}__bad"} = 0; $g{"${as}__badval"} = undef }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4705_4 line 4705 in _fold_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4705 in _fold_aggregate() to detect the mutant
    fail('COND_INV_4705_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4795_5 (MEDIUM) line 4795 in _fold_aggregate() ---
# Source:  if ($g->{"${as}__bad"} && !$bad_warned{$as}) {
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4795_5 line 4795 in _fold_aggregate()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4795 in _fold_aggregate() to detect the mutant
    fail('COND_INV_4795_5: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4831_4 (MEDIUM) line 4831 in _sort_and_page() ---
# Source:  if    (!defined $va && !defined $vb) { $cmp = 0 }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4831_4 line 4831 in _sort_and_page()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4831 in _sort_and_page() to detect the mutant
    fail('COND_INV_4831_4: replace with real assertion');
}

# --- SURVIVOR: COND_INV_4846_5 (MEDIUM) line 4846 in _sort_and_page() ---
# Source:  if    (!defined $va && !defined $vb) { $cmp = 0 }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: COND_INV_4846_5 line 4846 in _sort_and_page()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4846 in _sort_and_page() to detect the mutant
    fail('COND_INV_4846_5: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_4975_36_< (HIGH) line 4975 in _sqlite_aggregate() ---
# Source:  if ($join_type eq 'outer' && $n > 1) {
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (4 variants — one test should kill all):
#   Numeric boundary flip > to <
#   Numeric boundary flip > to >=
#   Numeric boundary flip > to <=
#   Invert condition if to unless
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_4975_36_< line 4975 in _sqlite_aggregate()';
    # Suggested boundary values to test: 0, 1, 2
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 4975 in _sqlite_aggregate() to detect the mutant
    fail('NUM_BOUNDARY_4975_36_<: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5101_2 (MEDIUM) line 5101 in _mandatory_op_to_crit() ---
# Source:  return $val;  # unreachable: validated at construction
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5101_2 line 5101 in _mandatory_op_to_crit()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5101 in _mandatory_op_to_crit() to detect the mutant
    fail('BOOL_NEGATE_5101_2: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5114_3 (MEDIUM) line 5114 in _pass_mandatory_filters() ---
# Source:  return 0 unless defined $rv;
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5114_3 line 5114 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5114 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5114_3: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5117_31 (MEDIUM) line 5117 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lt')       { return 0 unless $rv lt $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5117_31 line 5117 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5117 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5117_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5118_31 (MEDIUM) line 5118 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lte')      { return 0 unless $rv le $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5118_31 line 5118 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5118 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5118_31: replace with real assertion');
}

# --- SURVIVOR: BOOL_NEGATE_5120_31 (MEDIUM) line 5120 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'gte')      { return 0 unless $rv ge $val }
# Hint:    Add tests asserting both true and false outcomes
# Mutations on this line (1 variant):
#   Negate boolean return expression
TODO: {
    local $TODO = 'Complete: BOOL_NEGATE_5120_31 line 5120 in _pass_mandatory_filters()';
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5120 in _pass_mandatory_filters() to detect the mutant
    fail('BOOL_NEGATE_5120_31: replace with real assertion');
}

# --- SURVIVOR: NUM_BOUNDARY_5121_64_> (HIGH) line 5121 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'contains') { return 0 unless index($rv, $val) >= 0 }
# Hint:    Likely missing edge-case test (boundary value)
# Mutations on this line (3 variants — one test should kill all):
#   Numeric boundary flip >= to >
#   Numeric boundary flip >= to <
#   Numeric boundary flip >= to <=
TODO: {
    local $TODO = 'Complete: NUM_BOUNDARY_5121_64_> line 5121 in _pass_mandatory_filters()';
    # Suggested boundary values to test: -1, 0, 1
    # NOTE: new() called with no arguments as a starting point.
    # If Database::Join requires constructor arguments, add them here.
    my $obj = new_ok('Database::Join');
    # TODO: exercise line 5121 in _pass_mandatory_filters() to detect the mutant
    fail('NUM_BOUNDARY_5121_64_>: replace with real assertion');
}

# --- LOW DIFFICULTY HINTS (comment stubs) ---

# --- LOW HINT: RETURN_UNDEF_4617_5 line 4617 in _match_having_criterion() ---
# Source:  return 0 if $op eq 'IS NULL';   # value is defined
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4617_5: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4622_6 line 4622 in _match_having_criterion() ---
# Source:  return 0 unless grep { defined $_ && $_ eq $value } @items;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4622_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_4624_6 line 4624 in _match_having_criterion() ---
# Source:  return 0 if grep { defined $_ && $_ eq $value } @items;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_4624_6: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5101_2 line 5101 in _mandatory_op_to_crit() ---
# Source:  return $val;  # unreachable: validated at construction
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5101_2: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5114_3 line 5114 in _pass_mandatory_filters() ---
# Source:  return 0 unless defined $rv;
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5114_3: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5117_31 line 5117 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lt')       { return 0 unless $rv lt $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5117_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5118_31 line 5118 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'lte')      { return 0 unless $rv le $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5118_31: add assertion here');

# --- LOW HINT: RETURN_UNDEF_5120_31 line 5120 in _pass_mandatory_filters() ---
# Source:  elsif ($op eq 'gte')      { return 0 unless $rv ge $val }
# Hint:    Mutation survived, but impact may be minor
# Mutations on this line (1 variant):
#   Replace return expression with undef
# NOTE: new() called with no arguments as a starting point.
# If Database::Join requires constructor arguments, add them here.
# my $obj = new_ok('Database::Join');
# ok($obj->..., 'RETURN_UNDEF_5120_31: add assertion here');

done_testing();
