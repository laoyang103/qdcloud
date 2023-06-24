#!/bin/bash

# 计算节点安装脚本，主机名、IP地址、网卡名
if [ -z "$1" -o -z "$2" -o -z "$3" ]; then
  echo "使用方法：node.sh [hostname] [ipaddr] [nicname]"
  exit
fi

# 设置主机名
hostnamectl set-hostname $1

# 安装kvm和常用工具
yum -y install vim net-tools bridge-utils psmisc epel-release tcpdump net-tools psmisc
yum -y install qemu-kvm qemu-img libvirt libvirt-python python-virtinst libvirt-client virt-install

# 配置kvm网络访问，ssh取消DNS验证，永久关闭selinux
sed -i "s/#listen_tls/listen_tls/g" /etc/libvirt/libvirtd.conf
sed -i "s/#listen_tcp/listen_tcp/g" /etc/libvirt/libvirtd.conf
sed -i "s/#tcp_port/tcp_port /g" /etc/libvirt/libvirtd.conf
sed -i "s/#listen_addr..*$/listen_addr = \"0.0.0.0\"/g" /etc/libvirt/libvirtd.conf
sed -i "s/#auth_tcp..*$/auth_tcp = \"none\"/g" /etc/libvirt/libvirtd.conf
sed -i "s/#LIBVIRTD_ARGS/LIBVIRTD_ARGS/g" /etc/sysconfig/libvirtd 
sed -i "s/#UseDNS yes/UseDNS no/g" /etc/ssh/sshd_config
sed -i "s/enforcing/disabled/g" /etc/sysconfig/selinux

# 禁止启动防火墙，重启kvm、ssh服务
systemctl restart libvirtd
systemctl enable libvirtd
systemctl restart sshd
systemctl stop firewalld
systemctl disable firewalld
setenforce 0

# 挂载存储服务器的虚拟磁盘目录
echo -e "10.16.255.254:/data/vdisk/\t/var/lib/libvirt/images\tnfs\tdefaults\t0\t0" >> /etc/fstab 
mount -a

# 将所有学生的所有虚拟机定义出来（不开启）
find /var/lib/libvirt/images/ -name jx*.xml -exec virsh define {} \;

# 配置桥接IP地址和物理网卡
cat > /etc/sysconfig/network-scripts/ifcfg-br-vmr << EOF
TYPE=Bridge
BOOTPROTO=none
DEVICE=br-vmr
ONBOOT=yes
IPV6INIT=no
IPV6_AUTOCONF=no
DELAY=5
IPADDR=$2
PREFIX=16
GATEWAY=10.16.255.254
DNS1=8.8.8.8
EOF

# 配置桥接IP地址和物理网卡
cat > /etc/sysconfig/network-scripts/ifcfg-$3 << EOF
DEVICE="$3"
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
BRIDGE=br-vmr
EOF

read -p "请重启配置的网卡$3"
