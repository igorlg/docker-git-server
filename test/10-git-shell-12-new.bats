#!/usr/bin/env bats

load 'test_helper'

fixtures 'git-shell-new'

setup() {
  export CONTAINER_GIT_PATH="$(temp_make)"
  cp -Rp $FIXTURE_ROOT/* $CONTAINER_GIT_PATH/
  repo_ex="repo1"
  repo_ex_g="repo1.git"
  repo_nw="repo-2"
  repo_nw_g="repo-2.git"
}

teardown() {
  temp_del "$CONTAINER_GIT_PATH"
  unset CONTAINER_GIT_PATH
}

@test "it displays error msg when repo name missing" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new"
  assert_failure
  assert_line "Repository name not informed. Exiting"
}

@test "it displays error msg when repo already exists" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new" "${repo_ex}"
  assert_failure
  assert_line "Repository ${repo_ex_g} already exists"
}

@test "it appends '.git' to repo name if not provided" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new" "${repo_ex}"
  assert_failure
  assert_line "Repository ${repo_ex_g} already exists"
}

@test "it does not append '.git' to repo name if provided" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new" "${repo_ex_g}"
  assert_failure
  assert_line "Repository ${repo_ex_g} already exists"
}

@test "it creates new repo when not existing and name does not contain .git" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new" "${repo_nw}"
  assert_success
  assert_line --index 0 --regexp "^Initialized empty Git repository in .*/${repo_nw_g}/$"
}

@test "it creates new repo when not existing and name does contain .git" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new" "${repo_nw}"
  assert_success
  assert_line --index 0 --regexp "^Initialized empty Git repository in .*/${repo_nw_g}/$"
}

@test "it lists all repos after creating new ones" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new" "${repo_nw}"
  assert_success
  assert_line --index 1 "Available repos:"
  assert_line --index 2 "${repo_ex_g}"
  assert_line --index 3 "${repo_nw_g}"
}

@test "it creates valid new Git repos" {
  run "${BATS_TEST_DIRNAME}/../git-shell-commands/new" "${repo_nw}"
  assert_success
  assert_file_exist "${CONTAINER_GIT_PATH}/${repo_nw_g}/config"
  assert_file_exist "${CONTAINER_GIT_PATH}/${repo_nw_g}/description"
  assert_file_exist "${CONTAINER_GIT_PATH}/${repo_nw_g}/HEAD"
  assert_file_exist "${CONTAINER_GIT_PATH}/${repo_nw_g}/branches/"
}
