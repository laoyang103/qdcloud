#!/bin/bash

source /etc/openvpn/head.sh

stuno=$1
stuname=$($mysqllogin "select user_name from lab_user where user_id=$stuno" | grep -v user_name)
if [ -z "$stuname" ]; then
  echo "can not find stu with no $stuno."
  exit
fi

# 创建学生路由器虚拟机
rm $vdiskdir/$stuname -rf
cp -r $vdiskdir/stuvm/ $vdiskdir/$stuname 
vmr="$vdiskdir/$stuname/$stuname.qcow2"
qemu-img create -b $hpvdiskdir/mbvmr.qcow2 -F qcow2 -f qcow2 $vmr
chmod 755 $vmr

# 根据学生ID修改路由器WAN口IP
mkdir -p /tmp/$stuname
guestmount -a $vmr -m /dev/sda1 /tmp/$stuname
vmrip=$(num2ip $(echo $vmrbase + $stuno*4 - 2 | bc))
sed -i "s/IPADDR=..*$/IPADDR=$vmrip/g" /tmp/$stuname/$vdiskipcfg
sed -i "s/NETMASK=..*$/NETMASK=255.255.0.0/g" /tmp/$stuname/$vdiskipcfg
sed -i "s/GATEWAY=..*$/GATEWAY=$vmrgate/g" /tmp/$stuname/$vdiskipcfg
umount /tmp/$stuname
rm -rf /tmp/$stuname

# 生成虚拟机路由器xml定义文件
cp $vdiskdir/mbvmr.xml $vdiskdir/$stuname/$stuname.xml
wanmac=$(echo $vmmacpre:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//'))
lanmac=$(echo $vmmacpre:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//'))
sed -i "s/_VMRNAME/$stuname/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMRCPU/2/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMRMEM/2097152/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_WAN_BR/$vmrbr/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_WAN_MAC/$wanmac/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_LAN_BR/br-$stuname/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_LAN_MAC/$lanmac/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMRDISK/\/var\/lib\/libvirt\/images\/$stuname\/$stuname.qcow2/g" $vdiskdir/$stuname/$stuname.xml

# 所有虚拟机的xml定义文件
vmlist=$($mysqllogin "select name,cpu,mem,vmdisk from lab_vm" | grep -v name | sed "s/\t/@/g")
for vm in ${vmlist[@]}; do
  vmname=$(echo $vm | awk -F "@" '{print $1}' | sed "s/jx-/$stuname-/g")
  vmcpu=$(echo $vm | awk -F "@" '{print $2}')
  vmmem=$(echo $vm | awk -F "@" '{print $3}')
  vmdisk=$(echo $vm | awk -F "@" '{print $4}')
  vmmac=$(echo $vmmacpre:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//'))
  cp $vdiskdir/mbvm.xml $vdiskdir/$stuname/$vmname.xml
  sed -i "s/_VMNAME/$vmname/g" $vdiskdir/$stuname/$vmname.xml
  sed -i "s/_VMCPU/$vmcpu/g" $vdiskdir/$stuname/$vmname.xml
  sed -i "s/_VMMEM/$vmmem/g" $vdiskdir/$stuname/$vmname.xml
  sed -i "s/_VMBR/br-$stuname/g" $vdiskdir/$stuname/$vmname.xml
  sed -i "s/_VMMAC/$vmmac/g" $vdiskdir/$stuname/$vmname.xml
  sed -i "s/_VMDISK/\/var\/lib\/libvirt\/images\/$stuname\/$vmdisk/g" $vdiskdir/$stuname/$vmname.xml
done
