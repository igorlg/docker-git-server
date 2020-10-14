#!/bin/ash

source ./scripts/vars.sh

[[ -f "$VOLUME_CONFIG_PATH" ]] && \
[[ -f "$VOLUME_KEYS_PATH" ]]   && \
[[ -d "$VOLUME_DATA_PATH" ]]   && \
[[ `stat -c '%a' $VOLUME_KEYS_PATH` == "600" ]]

