#!/bin/bash 

# REMOTE_ADDR="10.32.1.146"
# QUERY_STRING="name=jx21080001-redis-27&action=reset"
echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

name=$(echo $QUERY_STRING | sed "s/\&/=/g" | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | sed "s/\&/=/g" | awk -F "=" '{print $4}')

if [ "$action" == "start" ]; then
  startvm $name
elif [ "$action" == "destroy" ]; then
  destroyvm $name
elif [ "$action" == "reset" ]; then
  resetvm $name
fi

echo "</br>"
echo "<a href="/cgi-bin/listvm.sh">返回列表</a>"
