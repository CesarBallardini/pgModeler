#!/usr/bin/env bash

PGMODELER_VERSION=1.1.3
PGMODELER_TAG=pgmodeler:${PGMODELER_VERSION}

build() {
  [ -d data/root/ ] || mkdir -p data/root/
  [ -d data/usr/local/lib/docker-pgmodeler/ ] || mkdir -p data/usr/local/lib/docker-pgmodeler/
  [ -d data/usr/local/lib/docker-pgmodeler/plugins ] || (pushd data/usr/local/lib/docker-pgmodeler/ ; git clone https://github.com/pgmodeler/plugins ; popd)

  #docker build --build-arg ARG_PGMODELER_VERSION=${PGMODELER_VERSION}   . -t ${PGMODELER_TAG}  --no-cache
  docker build --build-arg ARG_PGMODELER_VERSION=${PGMODELER_VERSION}   . -t ${PGMODELER_TAG} 
}

build
