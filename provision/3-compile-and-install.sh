#!/usr/bin/env bash

# args:
export NUM_CPUS=${1}


cd ~/pgmodeler/
qmake6 pgmodeler.pro
make -j${NUM_CPUS} -j${NUM_CPUS}
sudo make install

