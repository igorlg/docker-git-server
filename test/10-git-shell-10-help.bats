#!/usr/bin/env bats

load 'test_helper'

@test "it displays header information for INTERACTIVE sessions" {
  tty -s || skip
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/help"
  assert_success
  assert_line --index 0 "Run 'help' for help, or 'exit' to leave.  Available commands:"
}

@test "it displays header information for NON INTERACTIVE sessions" {
  tty -s && skip
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/help"
  assert_success
  assert_line --index 0 "Run 'help' for help.  Available commands:"
}

@test "it shows available command - list" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/help"
  assert_success
  assert_line 'list'
}

@test "it shows available command - new" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/help"
  assert_success
  assert_line 'new'
}

@test "it shows available command - no-interactive-login" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/help"
  assert_success
  assert_line 'no-interactive-login'
}

@test "it does not show the 'help' command" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/help"
  assert_success
  refute_line 'help'
}

