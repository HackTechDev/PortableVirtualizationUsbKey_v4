#!/bin/sh

./configure --enable-virglrenderer --enable-opengl --enable-sdl --enable-system --enable-modules --enable-libusb --target-list=x86_64-softmmu,arm-softmmu --enable-kvm --audio-drv-list=alsa
make -j 4
