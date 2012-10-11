#!/bin/sh

trap exit ERR

mkdir -p dist

export PATH=/Users/star/workspace/other/ndk/android-8-toolchain/bin:$PATH
export CC=arm-linux-androideabi-gcc
export PKG_CONFIG_PATH=/Users/star/deploy/library/android/librtmp/lib/pkgconfig:/Users/star/deploy/library/android/openssl/lib/pkgconfig:$PKG_CONFIG_PATH

./configure --target-os=linux \
    --prefix=dist \
    --enable-cross-compile \
    --cross-prefix=arm-linux-androideabi- \
    --enable-pic \
    --arch=arm \
    --as=arm-linux-androideabi-gcc \
    --sysroot=/Users/star/workspace/other/ndk/android-8-toolchain/sysroot \
    --extra-cflags="-O3 -DANDROID -DHAVE_SYS_UIO_H=1 -I/Users/star/deploy/library/android/x264/include/ -I/Users/star/deploy/library/android/librtmp/include/ -I/Users/star/deploy/library/android/openssl/include/" \
    --extra-ldflags="-Wl,-rpath-link=/Users/star/workspace/other/ndk/android-8-toolchain/sysroot/usr/lib/ -L/Users/star/workspace/other/ndk/android-8-toolchain/sysroot/usr/lib/ -L/Users/star/deploy/library/android/x264/lib/ -L/Users/star/deploy/library/android/librtmp/lib/ -L/Users/star/deploy/library/android/openssl/lib/" \
    --disable-doc \
    --disable-shared \
    --disable-ffplay \
    --disable-ffmpeg \
    --disable-ffserver \
    --enable-gpl \
    --enable-libx264 \
    --enable-librtmp \
    --disable-encoders \
    --disable-decoders \
    --disable-muxers \
    --disable-demuxers \
    --enable-decoder=h264 \
    --enable-encoder=libx264 \
    --enable-muxer=flv \
    --enable-muxer=h264 \
    --enable-demuxer=flv \
    --enable-demuxer=h264 \
    --disable-protocol=udp 

make && make install

echo "Installed: $DIR/dist"
