#!/usr/bin/bash

DISTRO=ubuntu
ISO=ubuntu.iso
SNAPSHOT="${DISTRO}-snapshot.qcow2"
sudo qemu-system-x86_64 \
-m 8G \
-enable-kvm \
-vga virtio \
-smp 4 \
-display default,show-cursor=on \
-usb \
-device usb-tablet \
-machine type=q35,vmport=off \
-drive file=${SNAPSHOT},format=qcow2 \
-netdev tap,id=mynet0,ifname=tap0,script=no,downscript=no \
-device e1000,netdev=mynet0,mac=52:55:00:d1:55:02
