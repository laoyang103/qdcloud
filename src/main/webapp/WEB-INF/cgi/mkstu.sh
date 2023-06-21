#!/bin/bash

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# 根据学生ID创建其路由器虚拟磁盘、虚拟机磁盘
# 在所有计算节点中定义其路由器和所有虚拟机

stuno=$1
# 检查数据库中是否存在学号
stuname=$($mysqllogin "select user_name from lab_user where user_id=$stuno" | grep -v user_name)
if [ -z "$stuname" ]; then
  echo "can not find stu with no $stuno."
  exit
fi

# 创建学生路由器虚拟磁盘
rm $vdiskdir/$stuname -rf
cp -r $vdiskdir/stuvm/ $vdiskdir/$stuname 
vmr="$vdiskdir/$stuname/$stuname.qcow2"
# 写时拷贝方式，不影响模板磁盘
qemu-img create -b $hpvdiskdir/mbvmr.qcow2 -F qcow2 -f qcow2 $vmr
chmod 755 $vmr

# 根据学生ID修改路由器WAN口IP
mkdir -p /tmp/$stuname
# 挂载路由器虚拟磁盘
guestmount -a $vmr -m /dev/sda1 /tmp/$stuname
# 计算该学生路由器WAN口IP地址，修改虚拟磁盘中的网卡配置文件
vmrip=$(num2ip $(echo $vmrbase + $stuno*4 - 2 | bc))
sed -i "s/IPADDR=..*$/IPADDR=$vmrip/g" /tmp/$stuname/$vdiskipcfg
sed -i "s/NETMASK=..*$/NETMASK=255.255.0.0/g" /tmp/$stuname/$vdiskipcfg
sed -i "s/GATEWAY=..*$/GATEWAY=$vmrgate/g" /tmp/$stuname/$vdiskipcfg
# 卸载路由器虚拟磁盘
umount /tmp/$stuname
rm -rf /tmp/$stuname

# 生成虚拟机路由器xml定义文件
cp $vdiskdir/mbvmr.xml $vdiskdir/$stuname/$stuname.xml
# 路由器的WAN口和LAN口MAC地址，随机生成
wanmac=$(echo $vmmacpre:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//'))
lanmac=$(echo $vmmacpre:$(openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//'))
# 根据学生的用户名生成路由器的定义文件（xml）
sed -i "s/_VMRNAME/$stuname/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMRCPU/2/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMRMEM/2097152/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_WAN_BR/$vmrbr/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_WAN_MAC/$wanmac/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_LAN_BR/br-$stuname/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMR_LAN_MAC/$lanmac/g" $vdiskdir/$stuname/$stuname.xml
sed -i "s/_VMRDISK/\/var\/lib\/libvirt\/images\/$stuname\/$stuname.qcow2/g" $vdiskdir/$stuname/$stuname.xml

# 在所有计算节点定义该路由器，但实际上只有一台开启
for hpv in ${hpvList[@]}; do
  virsh -c qemu+tcp://$hpv/system destroy $stuname
  virsh -c qemu+tcp://$hpv/system undefine $stuname
  virsh -c qemu+tcp://$hpv/system define $vdiskdir/$stuname/$stuname.xml
done

# 路由器后所有虚拟机的xml定义文件，和上面路由器的创建过程类似
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
  # 如果虚拟机名字包含pxeboot，说明时网启无盘虚拟机，删掉虚拟硬盘的定义
  if [ -n "$(echo $vmname | grep pxeboot)" ]; then
    sed -i "33,38d" $vdiskdir/$stuname/$vmname.xml
  fi
  for hpv in ${hpvList[@]}; do
    virsh -c qemu+tcp://$hpv/system destroy $vmname
    virsh -c qemu+tcp://$hpv/system undefine $vmname
    virsh -c qemu+tcp://$hpv/system define $vdiskdir/$stuname/$vmname.xml
  done
done
