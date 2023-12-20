#!/bin/bash

H_DISTRIB=lubuntu
H_VERSION=2204
H_PROC=64

QEVER=7.2.0

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:../../../../../../../part1/host/$H_DISTRIB/$H_VERSION/$H_PROC/qemu/$QEVER/lib/:../../../../../../../part1/host/$H_DISTRIB/$H_VERSION/$H_PROC/qemu/$QEVER/qemu-$QEVER/pc-bios/ \
    ../../../../../../../part1/host/$H_DISTRIB/$H_VERSION/$H_PROC/qemu/$QEVER/qemu-$QEVER/build/qemu-system-x86_64 \
    -drive file=vda.qcow2,format=qcow2,index=0,media=disk \
    -enable-kvm -m 2048 \
    -display sdl -vga std \ 
    -net nic,model=rtl8139 -net user \
    -smp 2 -rtc base=localtime
