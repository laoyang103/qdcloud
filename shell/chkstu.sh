#!/bin/bash

source /etc/openvpn/head.sh

stuList=$($mysqllogin "select user_id,user_name from lab_user where role_id=1 and user_id=101" | grep -v user_id | sed "s/\t/@/g")
for stu in ${stuList[@]}; do
  stuno=$(echo $stu | awk -F "@" '{print $1}')
  stuname=$(echo $stu | awk -F "@" '{print $2}')
  # 去所有宿主机检查学生vxlan网桥
  echo "check stu id $stuno name $stuname ..."
  for hpv in ${hpvList[@]}; do
    havebr=$(ssh root@$hpv "brctl show br-$stuname | grep vx-$stuname | head -n 1")
    if [ -z "$havebr" ]; then
      ssh root@$hpv "ip link add vx-$stuname type vxlan id $stuno dstport 4789 group 239.1.1.1 dev br-vmr"
      ssh root@$hpv "brctl addbr br-$stuname"
      ssh root@$hpv "brctl addif br-$stuname vx-$stuname"
      ssh root@$hpv "ip l set vx-$stuname up"
      ssh root@$hpv "ip l set dev br-$stuname up"
    fi
  done
done
