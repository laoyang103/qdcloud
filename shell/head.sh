#!/bin/bash

export LANG="en_US.UTF-8"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin"

time_stamp=`date "+%Y-%m-%d %T"`
log_file="/var/log/messages"
currfile="/tmp/iptables-curr.txt"
ccddir="/etc/openvpn/ccd/"
mysqllogin="mysql -uroot -p123456 jxcms -e "
vmrbase=168820736 # 10.16.0.0   10.16.0.2/10.16.0.6/10.16.0.10/10.16.0.14/10.16.0.18/...
vpnbase=169869312 # 10.32.0.0   10.32.0.2/10.32.0.6/10.32.0.10/10.32.0.14/10.32.0.18/...
vmipList=(11 12 13 21 22 26 27 28 31 32 36 37 38 41 51 52 61 71 81)

function addrule() {
  stuipn=$1
  stuvpn=$2
  for vmip in ${vmipList[@]}; do
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d 10.10.10.$vmip/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination $stuipn:$vmip"22"
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d 10.10.10.$vmip/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination $stuipn:$vmip"80"
  done
}
