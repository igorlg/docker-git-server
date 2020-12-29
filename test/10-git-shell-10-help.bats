#!/usr/bin/env bats

load 'test_helper'

@test "it displays header information for INTERACTIVE sessions" {
  run ./git-shell-commands/help
  assert_success
  assert_line --index 0 "Run 'help' for help, or 'exit' to leave.  Available commands:"
}

@test "it shows available command - list" {
  run ./git-shell-commands/help
  assert_success
  assert_line 'list'
}

@test "it shows available command - new" {
  run ./git-shell-commands/help
  assert_success
  assert_line 'new'
}

@test "it shows available command - no-interactive-login" {
  run ./git-shell-commands/help
  assert_success
  assert_line 'no-interactive-login'
}

@test "it does not show the 'help' command" {
  run ./git-shell-commands/help
  assert_success
  refute_line 'help'
}

