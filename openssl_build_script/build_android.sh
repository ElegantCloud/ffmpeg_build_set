#!/bin/sh

trap exit ERR

mkdir -p dist

export PATH=/Users/star/workspace/other/ndk/android-8-toolchain/bin:$PATH
export CROSS_COMPILE=arm-linux-androideabi-
#export CC=arm-linux-androideabi-gcc
#export RANLIB=arm-linux-androideabi-ranlib
#export AR=arm-linux-androideabi-ar

./Configure android --prefix=dist


make
# you may come across error during making, but the static libs are already generated, you can move them manually
cp *.a dist/lib/
cp -r include dist/
echo "installed in dist" 
