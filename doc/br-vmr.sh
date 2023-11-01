#!/bin/bash

# 网卡配置路径
path="/etc/sysconfig/network-scripts"
# 有IP的管理网卡
nic=$(ip r | grep default | awk '{print $5}')
# 有IP的管理网卡的IP地址
ip=$(cat $path/ifcfg-$nic | grep IPADDR | awk -F "=" '{print $2}')
# 有IP的管理网卡的IP地址掩码
maskname="PREFIX"
mask=$(cat $path/ifcfg-$nic | grep PREFIX | awk -F "=" '{print $2}')
if [ -z "$mask" ]; then
  maskname="NETMASK"
  mask=$(cat $path/ifcfg-$nic | grep NETMASK | awk -F "=" '{print $2}')
fi
# 有IP的管理网卡的网关地址
gateway=$(cat $path/ifcfg-$nic | grep GATEWAY | awk -F "=" '{print $2}')
# 有IP的管理网卡的DNS地址
dns=$(cat $path/ifcfg-$nic | grep DNS1 | awk -F "=" '{print $2}')

# 写入网桥配置
cat > $path/br-vmr << EOF
TYPE=Bridge
BOOTPROTO=none
DEVICE=br-vmr
ONBOOT=yes
DELAY=5
IPADDR=$ip
$maskname=$mask
GATEWAY=$gateway
DNS1=$dns
EOF

# 写入桥接物理网卡配置
cat > $path/ifcfg-$nic << EOF
DEVICE=$nic
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
BRIDGE=br-vmr
EOF

# 重启网卡和网桥
ifup br-vmr
service network restart
ifdown br-vmr; ifup br-vmr

