#!/bin/sh

trap exit ERR

mkdir -p dist

export PATH=/Users/star/workspace/other/ndk/android-8-toolchain/bin:$PATH
export CC=arm-linux-androideabi-gcc

./configure --host=arm-linux \
    --prefix=./dist \
    --cross-prefix=arm-linux-androideabi- \
    --enable-static \
    --enable-pic \

make && make install

echo "Installed: $DIR/dist"
