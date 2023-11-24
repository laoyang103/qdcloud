#!/bin/bash

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# 学生登录VPN进行认证的脚本，返回0为认证成功，1为失败
# openvpn调用时会把用户名、密码、远程IP以环境变量形式传递，具体如下
# 用户名：username="jx00000010"
# 密码：  password="123456"
# 远程IP：untrusted_ip=10.64.1.136
 
# 尝试查询该用户名的ID
mysqllogin="mysql -hdb.jxit.net.cn -ujxadmin -p123456Ww jxcms -e "
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
# 将客户端的固定IP保存到openvpn的客户端配置目录，每个用户一个文件
# 文件名为该用户的用户，内容为VPN客户端的固定ID（根据ID计算）
echo "ifconfig-push $ipstr $pestr"     > $ccddir/$username
echo "${time_stamp}: Successful authentication: username=\"$username\"." >> $log_file

# 检查管理节点的iptables相关规则，如果不存在则添加规则
ipnum=$(echo $vmrbase + $user_id*4 - 2 | bc)
ipvmr=$($mysqllogin "select inet_ntoa(\"$ipnum\")" | grep -v inet_ntoa)
haverule=$(iptables-save | grep $ipvmr -w | head -n 1)
if [ -z "$haverule" ]; then
  addrule $ipvmr $ipstr
fi

# 登录日志写入数据库
$mysqllogin "INSERT INTO lab_log VALUES(NULL, $user_id, \"$untrusted_ip\", $(date +%s))"

exit 0
