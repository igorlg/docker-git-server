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


# Load bats libraries by default, using helper function load_lib (above)
#
load_lib bats-support
load_lib bats-assert
load_lib bats-file
