#!/bin/sh

export QVER=7.2.0

mkdir $QVER
cd $QVER
mv ../qemu-$QVER.tar.xz .
unxz qemu-$QVER.tar.xz
tar xvf qemu-$QVER.tar
cd qemu-$QVER
./configure --enable-virglrenderer --enable-opengl --enable-sdl --enable-sdl-image --enable-system --enable-modules --enable-libusb --target-list=x86_64-softmmu,arm-softmmu --enable-kvm --audio-drv-list=alsa --enable-vnc --enable-vnc-jpeg --enable-slirp
make -j 4

mkdir ../lib

cd ../lib
wget https://raw.githubusercontent.com/COMBINE-lab/matryoshka/master/scripts/cpld.bash
chmod +x cpld.bash
./cpld.bash ../qemu-$QVER/build/x86_64-softmmu/qemu-system-x86_64 .

mkdir ../bin
cd ../bin
cp ../qemu-$QVER/build/qemu-system-x86_64 .
