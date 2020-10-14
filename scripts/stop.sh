#!/bin/ash

source ./scripts/vars.sh

docker kill $CONTAINER_NAME 2>/dev/null

exit 0

