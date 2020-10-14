#!/bin/ash

source ./scripts/vars.sh

docker rmi $(docker images -q -f dangling=true) 2>/dev/null
docker rmi $IMAGE_PREFIX/$IMAGE_NAME:$IMAGE_VERSION 2>/dev/null

exit 0

