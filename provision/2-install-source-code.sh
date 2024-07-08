#!/usr/bin/env bash

# args:
export PGMODELER_VERSION=${1:-1.1.3}


cd 

# get the source tarball
wget \
  --output-document="pgmodeler-${PGMODELER_VERSION}.tar.gz" \
  "https://github.com/pgmodeler/pgmodeler/archive/v${PGMODELER_VERSION}.tar.gz"

tar -xvzf "pgmodeler-${PGMODELER_VERSION}.tar.gz"
mv "pgmodeler-${PGMODELER_VERSION}/" pgmodeler


# include plugins
cd ~/pgmodeler/
git clone https://github.com/pgmodeler/plugins

