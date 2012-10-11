#!/bin/sh

trap exit ERR

mkdir -p dist

export PATH=/Users/star/workspace/other/ndk/android-8-toolchain/bin:$PATH

export CROSS_COMPILE=arm-linux-androideabi-
#export XCFLAGS="-isysroot /Users/star/workspace/other/ndk/android-8-toolchain/sysroot -I/Users/star/deploy/library/android/openssl/include/"
#export XLDFLAGS="-isysroot /Users/star/workspace/other/ndk/android-8-toolchain/sysroot -L/Users/star/deploy/library/android/openssl/lib/"

export XCFLAGS="-I/Users/star/deploy/library/android/openssl/include/"
export XLDFLAGS="-L/Users/star/deploy/library/android/openssl/lib/"

make SYS=arm-linux
make SYS=arm-linux prefix=dist/ install


