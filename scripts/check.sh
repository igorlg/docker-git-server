#!/bin/ash

source ./scripts/vars.sh

# [[ -f "$VOLUME_CONFIG_PATH" ]] && \
[[ -f "$VOLUME_KEYS_PATH" ]]                    && \
[[ -d "$VOLUME_DATA_PATH" ]]                    && \
[[ `stat -c '%a' $VOLUME_KEYS_PATH` == "600" ]] && \
[[ -z "$IMAGE_PREFIX" ]]	                      && \
[[ -z "$IMAGE_NAME" ]]		                      && \
[[ -z "$IMAGE_VERSION" ]]	                      && \
[[ -z "$CONTAINER_NAME" ]]	                    && \
[[ -z "$VOLUME_DATA_PATH" ]]                    && \
[[ -d "$VOLUME_DATA_PATH" ]]

