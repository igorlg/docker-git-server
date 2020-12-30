# Load a library from the '${BATS_TEST_DIRNAME}/test_helper' directory.
#
# Globals:
#   none
# Arguments:
#   $1 - name of library to load
# Returns:
#   0 - on success
#   1 - otherwise
load_lib() {
  local name="$1"
  load "test_helper/${name}/load"
}


# Load fixtures from dir '${BATS_TEST_DIRNAME}/fixtures' directory.
#
# Globals:
#   none
# Arguments:
#   $1 - name of fixture to load
# Returns:
#   0 - on success
#   1 - otherwise
fixtures() {
  FIXTURE_ROOT="$BATS_TEST_DIRNAME/fixtures/$1"
  RELATIVE_FIXTURE_ROOT="$(bats_trim_filename "$FIXTURE_ROOT")"
}


# Load bats libraries by default, using helper function load_lib (above)
#
load_lib bats-support
load_lib bats-assert
load_lib bats-file
# load_lib bats-mock

