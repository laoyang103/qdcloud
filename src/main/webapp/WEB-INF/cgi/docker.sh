#!/bin/bash
USER_ID=$1
USER_NAME=$2
VM_NAME=$3

IMAGE_PATH=/var/lib/libvirt/images/
DOCKER_IMAGE=registry.jxit.net.cn:5000/qdcloud/jxcentos:7

BRIDGE_NAME=br-$USER_NAME
PID_FILE=$IMAGE_PATH/$USER_NAME/$VM_NAME".pid"

GATEWAY=10.10.10.254
IP_LAST=$(echo $VM_NAME | awk -F "-" '{print $3}')
IP_ADDRESS=10.10.10.$IP_LAST/24

DNS_VOL=/etc/resolv.conf:/etc/resolv.conf
HOSTNAME_VOL=/tmp/hostname:/etc/hostname

echo $VM_NAME > /tmp/hostname

docker rm -f $VM_NAME
container_id=$(docker run -dt --name $VM_NAME --pidfile=$PID_FILE -v $DNS_VOL -v $HOSTNAME_VOL --privileged --net=none $DOCKER_IMAGE)

pid=$(docker inspect -f '{{.State.Pid}}' $container_id)
sudo mkdir -p /var/run/netns
sudo ln -s /proc/$pid/ns/net /var/run/netns/$pid

vnet_name=jx-$USER_ID-$IP_LAST
ip link add $vnet_name type veth peer name $vnet_name-r
brctl addif $BRIDGE_NAME $vnet_name
ip link set $vnet_name up
ip link set $vnet_name-r netns $pid
ip netns exec $pid ip link set dev $vnet_name-r name eth0
ip netns exec $pid ip link set eth0 up
ip netns exec $pid ip link set mtu 1300 dev eth0
ip netns exec $pid ip addr add $IP_ADDRESS dev eth0
ip netns exec $pid ip route add default via $GATEWAY dev eth0
