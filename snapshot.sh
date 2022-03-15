#!/usr/bin/bash

DISTRO=ubuntu
ISO=ubuntu.iso
SNAPSHOT="${DISTRO}-snapshot.qcow2"
qemu-img create -f qcow2 -F qcow2 -b ${DISTRO}.qcow2 ${SNAPSHOT}
