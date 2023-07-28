#!/bin/bash

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# 根据学生ID创建其路由器虚拟磁盘、虚拟机磁盘
# 在所有计算节点中定义其路由器和所有虚拟机

stuname=$1
# 检查数据库中是否存在学号
stuno=$($mysqllogin "select user_id from lab_user where user_name=\"$stuname\"" | grep -v user_id)
if [ -z "$stuno" ]; then
  echo "can not find stu with $stuname."
  exit
fi

# 销毁路由器
destroyvm $stuname

# 删除学生路由器虚拟磁盘
vmr="$vdiskdir/$stuname/$stuname.qcow2"
rm $vmr -rf
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

# 开启路由器
startvm $stuno $stuname $stuname
