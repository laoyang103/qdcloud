#!/bin/bash

export LANG="en_US.UTF-8"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin"

time_stamp=`date "+%Y-%m-%d %T"`
log_file="/var/log/messages"
currfile="/tmp/iptables-curr.txt"
ccddir="/etc/openvpn/ccd/"
hpvdiskdir="/var/lib/libvirt/images/"
mysqllogin="mysql -uroot -p123456 jxcms -e "
vmrbr="br-vmr"
vmmacpre="92:10:25"
vmrgate=10.16.255.254 
vmrbase=168820736 # 10.16.0.0   10.16.0.2/10.16.0.6/10.16.0.10/10.16.0.14/10.16.0.18/...
vpnbase=169869312 # 10.32.0.0   10.32.0.2/10.32.0.6/10.32.0.10/10.32.0.14/10.32.0.18/...
vmipList=$($mysqllogin "select ipaddr from lab_vm" | grep -v ipaddr)
hpvList=$($mysqllogin "select ipaddr from lab_hpv" | grep -v ipaddr)

vdiskdir="/data/vdisk/"
vdiskvmr="$vdiskdir/mbvmr.qcow2"
vdiskipcfg="/etc/sysconfig/network-scripts/ifcfg-eth1"

function num2ip() {
  $mysqllogin "select inet_ntoa(\"$1\")" | grep -v inet_ntoa
}

function addrule() {
  stuipn=$1
  stuvpn=$2
  for vmip in ${vmipList[@]}; do
    ip4=$(echo $vmip | awk -F "." '{print $4}')
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination $stuipn:$ip4"22"
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination $stuipn:$ip4"80"
  done
}
