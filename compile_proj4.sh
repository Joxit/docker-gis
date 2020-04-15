#!/bin/bash
set -e;
export LC_ALL=en_US.UTF-8;
export DEBIAN_FRONTEND=noninteractive;

# location of this file in filesystem
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

# install the latest version of protozero
# https://github.com/mapbox/protozero

sudo apt-get update;
# install dependencies
sudo apt-get -y install cmake curl

# clean up
rm -rf $DIR/tmp;
rm -rf $DIR/tmp/proj4;
mkdir -p $DIR/tmp/proj4;

# make protozero
cd $DIR/tmp/proj4;
curl -sSL https://github.com/OSGeo/PROJ/archive/6.3.1.tar.gz | tar xz --strip-component=1;
./autogen.sh
./configure;
make -j8;
sudo make install;
sudo ldconfig;
