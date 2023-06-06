#!/bin/bash

currfile="/tmp/iptables-curr.txt"
confdir="/etc/ocserv/config-per-user/"
mysqllogin="mysql -uroot -p123456 jxcms -e "
stubase=168493056 # 10.11.0.0   10.11.0.2/10.11.0.6/10.11.0.10/10.11.0.14/10.11.0.18/...
vpnbase=168558592 # 10.12.0.0   10.12.0.2/10.12.0.6/10.12.0.10/10.12.0.14/10.12.0.18/...
vmipList=(11 12 13 21 22 26 27 28 31 32 36 37 38 41 51 52 61 71 81)

function num2ip() {
  H1=$(($1 & 0x000000ff))
  H2=$((($1 & 0x0000ff00) >> 8))
  L1=$((($1 & 0x00ff0000) >> 16))
  L2=$((($1 & 0xff000000) >> 24))
  echo $L2.$L1.$H2.$H1
}

function addrule() {
  stuipn=$1
  stuvpn=$2
  for vmip in ${vmipList[@]}; do
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d 10.10.10.$vmip/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination $stuipn:$vmip"22"
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d 10.10.10.$vmip/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination $stuipn:$vmip"80"
  done
}

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

  # 检查学生VPN固定分配IP配置
  stuname=$(echo $stu | awk -F "@" '{print $2}')
  vpnNetwork=$(num2ip $(echo $vpnbase + $stuno*4 - 4 | bc))
  haveconf=$(find $confdir -name $stuname | head -n 1)
  if [ -z "$haveconf" ]; then
    echo "ipv4-network = $vpnNetwork" > $confdir/$stuname
    echo "ipv4-netmask = 255.255.255.252" >> $confdir/$stuname
  fi
done

