#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export APT_OPTIONS=' -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold '

sudo apt-get update

# requisites for running
sudo apt-get install postgresql ${APT_OPTIONS}
sudo apt-get install libqt6svg6 libpq-dev libxext-dev ${APT_OPTIONS}

# requisites for building
sudo apt-get install make g++ libxml2-dev pkg-config ${APT_OPTIONS}
sudo apt-get install qt6-base-dev libqt6svg6-dev qt6-tools-dev qmake6 ${APT_OPTIONS}

