#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# 对某个虚拟机进行操作，浏览器传递ID、用户名、虚拟机名、动作
# QUERY_STRING="user_id=3&user_name=jx00000003&name=jx00000003-mysql-master-36&action=start"
user_id=$(echo $QUERY_STRING | awk -F "&" '{print $1}' | awk -F "=" '{print $2}')
user_name=$(echo $QUERY_STRING | awk -F "&" '{print $2}' | awk -F "=" '{print $2}')
vmname=$(echo $QUERY_STRING | awk -F "&" '{print $3}' | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | awk -F "&" '{print $4}' | awk -F "=" '{print $2}')

# 开启虚拟机（同时开启其网关路由器）
if [ "$action" == "start" ]; then
  vmnametmp=$vmname
  startvm $user_id $user_name $user_name
  startvm $user_id $user_name $vmnametmp
# 关闭虚拟机
elif [ "$action" == "destroy" ]; then
  destroyvm $vmname
# 重置虚拟机
elif [ "$action" == "reset" ]; then
  resetvm $vmname
# 虚拟机连接信息
elif [ "$action" == "connect" ]; then
  connectvm $vmname
fi

echo "</br>"
echo "<a href="/view/studenttask/vmlist.jsp">返回列表</a>"
