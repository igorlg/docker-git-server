#!/bin/ash

source ./scripts/vars.sh

docker build -t $IMAGE_PREFIX/$IMAGE_NAME:$IMAGE_VERSION .

docker images

