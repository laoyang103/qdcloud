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
vmList=$($mysqllogin "select name from lab_vm" | grep -v name)
vmipList=$($mysqllogin "select ipaddr from lab_vm" | grep -v ipaddr)
hpvList=$($mysqllogin "select ipaddr from lab_hpv" | grep -v ipaddr)
hpvFirst=$($mysqllogin "select ipaddr from lab_hpv limit 1" | grep -v ipaddr)

vdiskdir="/data/vdisk/"
vdiskvmr="$vdiskdir/mbvmr.qcow2"
vdiskipcfg="/etc/sysconfig/network-scripts/ifcfg-eth1"

function num2ip() {
  $mysqllogin "select inet_ntoa(\"$1\")" | grep -v inet_ntoa
}

function ip2num() {
  $mysqllogin "select inet_aton(\"$1\")" | grep -v inet_aton
}

# 如果远程地址不为空获取操作学生的ID
if [ -n "$REMOTE_ADDR" ]; then
  ipnum=$(ip2num $REMOTE_ADDR)
  user_id=$(echo "($ipnum - $vpnbase + 2)/4" | bc)
  if [ -z "$user_id" ]; then
    echo "bad REMOTE_ADDR $REMOTE_ADDR"
    exit
  fi
  sql="select user_name from lab_user where user_id=\"$user_id\""
  user_name=$($mysqllogin "$sql" | grep -v user_name)
  if [ -z "$user_name" ]; then
    echo "bad REMOTE_ADDR $REMOTE_ADDR"
    exit
  fi
fi

function addrule() {
  stuipn=$1
  stuvpn=$2
  for vmip in ${vmipList[@]}; do
    ip4=$(echo $vmip | awk -F "." '{print $4}')
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination $stuipn:$ip4"22"
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination $stuipn:$ip4"80"
  done
}

function startvm() {
  vmname=$1
  for hpv in ${hpvList[@]}; do
    state=$(virsh -c qemu+tcp://$hpv/system dominfo $vmname | grep State| awk '{print $2}')
    if [ "running" == "$state" ]; then
      echo "domain $vmname is running on $hpv ..."
      return
    fi
  done

  minhpv=$hpvFirst
  mincnt=$(virsh -c qemu+tcp://$hpvFirst/system list | wc -l)
  for hpv in ${hpvList[@]}; do
    vcnt=$(virsh -c qemu+tcp://$hpv/system list | wc -l)
    if [ $vcnt -lt $mincnt ]; then
      minhpv=$hpv
      break
    fi
  done
  echo "starting $vmname on $minhpv ..."
  echo "virsh -c qemu+tcp://$minhpv/system start $vmname"
  virsh -c qemu+tcp://$minhpv/system start $vmname
}

function statevm() {
  vmname=$1
  state="shut"
  for hpv in ${hpvList[@]}; do
    state=$(virsh -c qemu+tcp://$hpv/system dominfo $vmname | grep State| awk '{print $2}')
    if [ "running" == "$state" ]; then
      break
    fi
  done
  echo $state
}

function destroyvm() {
  vmname=$1
  for hpv in ${hpvList[@]}; do
    virsh -c qemu+tcp://$hpv/system destroy $vmname
  done
}

function resetvm() {
  vmname=$1
  for hpv in ${hpvList[@]}; do
    virsh -c qemu+tcp://$hpv/system destroy $vmname
  done
  vmdisk=$(echo $vmname | sed "s/jx[0-9]\{8\}-/jx-/g" | sed "s/$/.qcow2/g")
  rm $vdiskdir/$user_name/$vmdisk
  cp $vdiskdir/stuvm/$vmdisk $vdiskdir/$user_name/$vmdisk
}
