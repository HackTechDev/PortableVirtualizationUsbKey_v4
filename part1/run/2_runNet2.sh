#!/bin/bash


echo "Remove Docker network interface"

sudo ip link delete docker0 

echo "Remove all iptable rules"

sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -F
sudo iptables -X

echo "Initialize Network"

networkinterface=`ip addr show | awk '/inet.*brd/{print $NF; exit}'`

sudo ip addr flush dev $networkinterface
sudo ip link set $networkinterface up
sudo ip link add name br0 type bridge

sleep 2

sudo ip link set $networkinterface master br0
sudo ip addr add 192.168.1.3/24 dev br0

sleep 2

sudo ip link set br0 up
sudo ip route add default via 192.168.1.1

sleep 2 

sudo ip tuntap add tap0 mode tap user util01
sudo ip link set tap0 up
sudo ip link set tap0 master br0

sleep 2 

sudo ip tuntap add tap1 mode tap user util01
sudo ip link set tap1 up
sudo ip link set tap1 master br0

sleep 2 


sudo brctl show

ip a

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf >/dev/null
