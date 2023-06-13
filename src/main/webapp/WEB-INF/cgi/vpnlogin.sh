#!/bin/bash

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# username="jx00000010"
# password="123456"
 
mysqllogin="mysql -uroot -p123456 jxcms -e "
sql="select user_id from lab_user where user_name=\"$username\" and password=\"$password\""
user_id=$($mysqllogin "$sql" | grep -v user_id)
 
# 没有用户直接退出
if [ -z "$user_id" ]; then 
  echo "$time_stamp: User does not exist: username=\"$username\", password=\"$password\"." >> $log_file
  exit 1
fi

# 生成学生VPN固定分配IP配置
ipnum=$(echo $vpnbase + $user_id*4 - 2 | bc)
penum=$(echo $vpnbase + $user_id*4 - 3 | bc)
ipstr=$($mysqllogin "select inet_ntoa(\"$ipnum\")" | grep -v inet_ntoa)
pestr=$($mysqllogin "select inet_ntoa(\"$penum\")" | grep -v inet_ntoa)
echo "ifconfig-push $ipstr $pestr"     > $ccddir/$username
echo "${time_stamp}: Successful authentication: username=\"$username\"." >> $log_file

# 检查iptables相关规则
ipnum=$(echo $vmrbase + $user_id*4 - 2 | bc)
ipvmr=$($mysqllogin "select inet_ntoa(\"$ipnum\")" | grep -v inet_ntoa)
haverule=$(iptables-save | grep $ipvmr | head -n 1)
if [ -z "$haverule" ]; then
  addrule $ipvmr $ipstr
fi

# 去所有宿主机检查学生vxlan网桥
echo "check stu id $user_id name $username ..."
for hpv in ${hpvList[@]}; do
  havebr=$(ssh root@$hpv "brctl show br-$username | grep vx-$username | head -n 1")
  if [ -z "$havebr" ]; then
    ssh root@$hpv "ip link add vx-$username type vxlan id $user_id dstport 4789 group 239.1.1.1 dev br-vmr"
    ssh root@$hpv "brctl addbr br-$username"
    ssh root@$hpv "brctl addif br-$username vx-$username"
    ssh root@$hpv "ip l set vx-$username up"
    ssh root@$hpv "ip l set dev br-$username up"
  fi
done

# 开启当前学生的路由器
startvm $username

exit 0
