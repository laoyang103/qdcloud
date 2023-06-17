#!/bin/bash 

# QUERY_STRING="user_id=3&user_name=jx00000003&name=jx00000003-mysql-master-36&action=start"
echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

user_id=$(echo $QUERY_STRING | awk -F "&" '{print $1}' | awk -F "=" '{print $2}')
user_name=$(echo $QUERY_STRING | awk -F "&" '{print $2}' | awk -F "=" '{print $2}')
vmname=$(echo $QUERY_STRING | awk -F "&" '{print $3}' | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | awk -F "&" '{print $4}' | awk -F "=" '{print $2}')

if [ "$action" == "start" ]; then
  vmnametmp=$vmname
  startvm $user_id $user_name $user_name
  startvm $user_id $user_name $vmnametmp
elif [ "$action" == "destroy" ]; then
  destroyvm $vmname
elif [ "$action" == "reset" ]; then
  resetvm $vmname
elif [ "$action" == "connect" ]; then
  connectvm $vmname
fi

echo "</br>"
echo "<a href="/view/studenttask/vmlist.jsp">返回列表</a>"
