#!/usr/bin/bash

DISTRO=ubuntu
qemu-img create -f qcow2 ${DISTRO}.qcow2 40G
