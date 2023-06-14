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

exit 0
