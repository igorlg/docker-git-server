#!/usr/bin/env bats

load 'test_helper'

fixtures 'git-shell-list'

setup() {
  export CONTAINER_GIT_PATH="${FIXTURE_ROOT}"
}

teardown() {
  unset CONTAINER_GIT_PATH
}

@test "it displays header 'Available repos:'" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/list"
  assert_success
  assert_line --index 0 "Available repos:"
}

@test "it lists directories ending in .git under \$CONTAINER_GIT_PATH" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/list"
  assert_success
  assert_line --index 1 --regexp '^.+\.git$'
  assert_line --index 2 --regexp '^.+\.git$'
}

@test "it does not list directories not ending in .git under \$CONTAINER_GIT_PATH" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/list"
  assert_success
  refute_line --index 1 --regexp '^.+[^\.git]$'
  refute_line --index 2 --regexp '^.+[^\.git]$'
}

