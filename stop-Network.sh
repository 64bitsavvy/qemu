#!/usr/bin/bash

service isc-dhcp-server stop

INTERFACE="eth0"

brctl delif br0 tap0
tunctl -d tap0
brctl delif br0 eth0
ifconfig br0 down
brctl delbr br0

ip addr flush dev eth0
ip link delete ${INTERFACE} type dummy
rmmod dummy
