#!/bin/ash

source ./scripts/vars.sh

# if [[ `docker ps -aq -f name=$CONTAINER_NAME | wc -l` == "1" ]]; then
# 	docker kill $CONTAINER_NAME
# 	docker rm $CONTAINER_NAME
# fi

docker run \
	--detach \
	--restart=unless-stopped \
	--name $IMAGE_NAME \
	--publish "$EXPOSE_SSH_PORT:22" \
	-v "${VOLUME_DATA_PATH}:/git" \
	-v "${VOLUME_KEYS_PATH}:/home/git/.ssh/authorized_keys:ro" \
	"$IMAGE_PREFIX/$IMAGE_NAME:$IMAGE_VERSION"

# removed:
#	-v "${VOLUME_CONFIG_PATH}:/etc/ssh/sshd_config:ro" \

docker ps -a

