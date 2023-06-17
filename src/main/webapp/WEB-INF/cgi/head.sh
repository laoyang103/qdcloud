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

function addrule() {
  stuipn=$1
  stuvpn=$2
  for vmip in ${vmipList[@]}; do
    ip4=$(echo $vmip | awk -F "." '{print $4}')
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination $stuipn:$ip4"22"
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination $stuipn:$ip4"80"
  done
}

function addvxlan() {
  # 去所有宿主机检查学生vxlan网桥
  user_id=$1
  user_name=$2
  echo "check stu id $user_id name $user_name ..."
  for hpv in ${hpvList[@]}; do
    havebr=$(ssh root@$hpv "brctl show br-$user_name | grep vx-$user_name | head -n 1")
    if [ -z "$havebr" ]; then
      ssh root@$hpv "ip link add vx-$user_name type vxlan id $user_id dstport 4789 group 239.1.1.1 dev br-vmr"
      ssh root@$hpv "brctl addbr br-$user_name"
      ssh root@$hpv "brctl addif br-$user_name vx-$user_name"
      ssh root@$hpv "ip l set vx-$user_name up"
      ssh root@$hpv "ip l set dev br-$user_name up"
    fi
  done
}

function startvm() {
  user_id=$1
  user_name=$2
  vmname=$3
  # 开启之前先检查vxlan网桥
  addvxlan $user_id $user_name

  # 确定该虚拟机是否已经开启
  for hpv in ${hpvList[@]}; do
    state=$(virsh -c qemu+tcp://$hpv/system dominfo $vmname | grep State| awk '{print $2}')
    if [ "running" == "$state" ]; then
      echo "domain $vmname is running on $hpv ..."
      return
    fi
  done

  # 寻找一台最空闲宿主机启动该虚拟机
  minhpv=$hpvFirst
  mincnt=$(virsh -c qemu+tcp://$hpvFirst/system list | wc -l)
  for hpv in ${hpvList[@]}; do
    vcnt=$(virsh -c qemu+tcp://$hpv/system list | wc -l)
    if [ $vcnt -lt $mincnt ]; then
      minhpv=$hpv
    fi
  done
  minhpv="10.16.255.5"
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
  echo "rm $vdiskdir/$user_name/$vmdisk"
  echo "cp $vdiskdir/stuvm/$vmdisk $vdiskdir/$user_name/$vmdisk"
}

function connectvm() {
  vmname=$1
  for hpv in ${hpvList[@]}; do
    vncport=$(virsh -c qemu+tcp://$hpv/system vncdisplay $vmname | head -n 1 | sed "s/://g")
    if [ -n "$vncport" -a -n "$(echo $vncport | grep [0-9])" ]; then
      echo "<h1>虚拟机：$vmname</h1>"
      echo -n "<h1>以下需要通过VPN连接，<a href="/view/manual/jxvpn-wan.pdf">VPN安装教程</a></h1>"
      echo -n "<h2>IP地址：10.10.10.$(echo $vmname | awk -F "-" '{print $NF}')</h2>"
      echo "<h2>VNC地址：$hpv:$(echo $vncport + 5900 | bc)</h2>"
      break;
    fi
  done
}

