#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export APT_OPTIONS=' -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold '


sudo apt-get remove --purge make g++ libxml2-dev pkg-config qmake6 ${APT_OPTIONS}
sudo apt-get autoremove ${APT_OPTIONS}

