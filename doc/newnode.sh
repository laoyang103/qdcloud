#!/bin/bash

echo "                                    用ansible安装计算集群软件                                             "
echo "=========================================================================================================="

# 下载计算节点软件包
curl http://stu.jxit.net.cn:88/qdcloud/rpm-kvm.tar.gz -o /opt/rpm-kvm.tar.gz
tar -zxf /opt/rpm-kvm.tar.gz -C /opt

# 所有计算节点安装KVM虚拟化软件
yum -y install /opt/rpm-kvm/*.rpm

read -p "请按任意键继续"

echo "                                    用ansible配置计算节点KVM网络监听                                      "
echo "=========================================================================================================="

# 配置libvirtd服务监听网络端口，让管理节点对其进行操控
sed -i 's/#listen_tls/listen_tls/g' /etc/libvirt/libvirtd.conf
sed -i 's/#listen_tcp/listen_tcp/g' /etc/libvirt/libvirtd.conf
sed -i 's/#tcp_port/tcp_port /g' /etc/libvirt/libvirtd.conf
sed -i 's/#listen_addr..*$/listen_addr = \"0.0.0.0\"/g' /etc/libvirt/libvirtd.conf
sed -i 's/#auth_tcp..*$/auth_tcp = \"none\"/g' /etc/libvirt/libvirtd.conf
sed -i 's/#LIBVIRTD_ARGS/LIBVIRTD_ARGS/g' /etc/sysconfig/libvirtd
systemctl restart libvirtd
systemctl enable libvirtd

# 所有计算节点都销毁默认KVM网桥virbr0
virsh net-destroy default
virsh net-undefine default

read -p "请按任意键继续"

echo "                                    用ansible配置计算节点关闭防火墙selinux                                "
echo "=========================================================================================================="

# 所有计算节点关闭防火墙和selinux
sed -i "s/enforcing/disabled/g" /etc/sysconfig/selinux
systemctl stop firewalld; systemctl disable firewalld; setenforce 0

read -p "请按任意键继续"

echo "                                    用ansible配置计算节点挂载NFS存储目录到虚拟磁盘目录                    "
echo "=========================================================================================================="

# 所有计算节点挂载存储节点的/data/vdisk到KVM虚拟磁盘目录/var/lib/libvirt/images
echo -e "10.16.255.253:/data/vdisk/\t/var/lib/libvirt/images\tnfs\tdefaults\t0\t0" >> /etc/fstab
mount -a
df | grep images

read -p "请按任意键继续"

echo "                   配置好后用 systemctl restart network重启生效，远程操作有风险！                         "
echo "=========================================================================================================="

localnic=$(ip r | grep default | awk '{print $5}')
localIP=`ip  addr show $localnic | grep -w inet | grep -v 127.0.0.1 | head -n 1 | awk '{print $2}' | awk -F "/" '{print $1}'`

cat > /etc/sysconfig/network-scripts/br-vmr << EOF
TYPE=Bridge
BOOTPROTO=none
DEVICE=br-vmr
ONBOOT=yes
IPV6INIT=no
IPV6_AUTOCONF=no
DELAY=5
IPADDR=$localIP
NETMASK=255.255.0.0
GATEWAY=10.16.255.254
DNS1=10.16.255.254
EOF

cat > /etc/sysconfig/network-scripts/ifcfg-$localnic << EOF
DEVICE=$localnic
BOOTPROTO="static"
ONBOOT="yes"
TYPE="Ethernet"
USERCTL="yes"
PEERDNS="yes"
IPV6INIT="no"
PERSISTENT_DHCLIENT="1"
BRIDGE=br-vmr
EOF

read -p "请按任意键继续"


echo "                   配置好后用 systemctl restart network重启生效，远程操作有风险！                         "
echo "=========================================================================================================="
ifup br-vmr; systemctl restart network

echo "                   从10.16.255.1上，拷贝虚拟机xml配置文件！                         "
echo "=========================================================================================================="
xmldir="/etc/libvirt/qemu"
scp 10.16.255.1:$xmldir/*.xml $xmldir

xmllist=$(find $xmldir -name "*.xml")
for xml in ${xmllist}; do
  virsh define $xml
done


