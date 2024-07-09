#!/usr/bin/env bash

run() {
  docker run \
    --rm \
    -it \
    --net=host \
    -e DISPLAY \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v ./data/root:/root \
    -v ./data/usr/local/lib/docker-pgmodeler/plugins:/usr/local/lib/docker-pgmodeler/plugins \
    pgmod
}

run
