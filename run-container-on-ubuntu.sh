#!/usr/bin/env bash

PGMODELER_VERSION=1.1.6
PGMODELER_TAG=pgmodeler:${PGMODELER_VERSION}

run() {
  docker run \
    --rm \
    -it \
    --net=host \
    -e DISPLAY \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v ./data/root:/root \
    -v ./data/usr/local/lib/docker-pgmodeler/plugins:/usr/local/lib/docker-pgmodeler/plugins \
    ${PGMODELER_TAG}
}

run
