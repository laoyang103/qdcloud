#!/bin/bash

source /etc/openvpn/head.sh

iptables-save > $currfile
stuList=$($mysqllogin "select user_id,user_name from lab_user where role_id=1" | grep -v user_id | sed "s/\t/@/g")
for stu in ${stuList[@]}; do
  # 检查iptables相关规则
  stuno=$(echo $stu | awk -F "@" '{print $1}')
  stuipn=$(num2ip $(echo $stubase + $stuno*4 - 2 | bc))
  stuvpn=$(num2ip $(echo $vpnbase + $stuno*4 - 2 | bc))
  echo "check stu $no ipn: $stuipn vpn: $stuvpn ..."
  haverule=$(grep $stuvpn $currfile | head -n 1)
  if [ -z "$haverule" ]; then
    addrule $stuipn $stuvpn
  fi
done

