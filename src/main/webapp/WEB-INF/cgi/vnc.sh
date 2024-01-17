#!/bin/bash

echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

source head.sh

# 获取ID,用户名,虚拟机名,动作
# QUERY_STRING="user_id=1&user_name=jx00000001&vmname=jx00000001-nginx-11&action=connect"
user_id=$(echo $QUERY_STRING | awk -F "&" '{print $1}' | awk -F "=" '{print $2}')
user_name=$(echo $QUERY_STRING | awk -F "&" '{print $2}' | awk -F "=" '{print $2}')
vmname=$(echo $QUERY_STRING | awk -F "&" '{print $3}' | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | awk -F "&" '{print $4}' | awk -F "=" '{print $2}')

# 如果获取不到可用区域名，则是管理中心
# 将操作请求封装为消息放入MQ对应学生可用区的消息队列
# 可用区主节点会从消息队列获取，执行相应的操作
if [ -z "$regiondomain" -a -z "$regionwebport" ]; then
  # 获取学生所在可用区的域名，可用区域名就是在MQ中的消息队列名
  regiondomain=$($mysqllogin "select concat(lab_region.domain,':',lab_region.webport)  from lab_user join lab_region on lab_user.region=lab_region.id where lab_user.user_id=$user_id;" | grep -v domain)
fi

curl $regiondomain/cgi-bin/dovm.sh?$QUERY_STRING
