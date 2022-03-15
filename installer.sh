#!/usr/bin/bash

DISTRO=ubuntu
qemu-system-x86_64 \
 -m 8G \
 -enable-kvm \
 -vga virtio \
 -smp 4 \
 -display default,show-cursor=on \
 -usb \
 -device usb-tablet \
 -machine type=q35,vmport=off \
 -smp 2 \
 -cdrom ${DISTRO}.iso \
 -drive file=${DISTRO}.qcow2,if=virtio  
