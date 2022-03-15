#!/usr/bin/bash

IP_ADDRESS="192.168.4.10"
INTERFACE="eth0"
MAC="C8:D7:4A:4E:47:50"

modprobe dummy
ip link add ${INTERFACE} type dummy
ip link show ${INTERFACE}
ifconfig ${INTERFACE} hw ether ${MAC}
ip addr add ${IP_ADDRESS}/24 brd + dev eth0 label ${INTERFACE}:0
ip link set dev ${INTERFACE} up
brctl addbr br0
ip addr flush dev eth0
brctl addif br0 eth0
tunctl -t tap0 -u `whoami`
brctl addif br0 tap0
ifconfig eth0 up
ifconfig tap0 up
ifconfig br0 up
brctl show

ifconfig br0 192.168.4.100/24

service isc-dhcp-server restart
