#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

source head.sh

# 对某个虚拟机进行操作，浏览器传递ID、用户名、虚拟机名、动作
# QUERY_STRING="user_id=3&user_name=jx00000003&name=jx00000003-mysql-master-36&action=start"
user_id=$(echo $QUERY_STRING | awk -F "&" '{print $1}' | awk -F "=" '{print $2}')
user_name=$(echo $QUERY_STRING | awk -F "&" '{print $2}' | awk -F "=" '{print $2}')
vmname=$(echo $QUERY_STRING | awk -F "&" '{print $3}' | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | awk -F "&" '{print $4}' | awk -F "=" '{print $2}')

# 如果获取不到可用区域名，则是管理中心
# 将操作请求封装为消息放入MQ对应学生可用区的消息队列
# 可用区主节点会从消息队列获取，执行相应的操作
if [ -z "$regiondomain" -a -z "$regionwebport" ]; then
  # 获取学生所在可用区的域名，可用区域名就是在MQ中的消息队列名
  regiondomain=$($mysqllogin "select lab_region.domain from lab_user join lab_region on lab_user.region=lab_region.id where lab_user.user_id=$user_id;" | grep -v domain)
  msg=$(echo $mqpushtmpl | sed "s/__msg/$QUERY_STRING/g" | sed "s/__region_queue_name/$regiondomain/g" | sed "s/__msg/\&/g")
  output=$(curl -u $mqlogin $mqpushurl -d "$msg")
  if [ -n "$(echo $output | grep 'true' | grep -v grep)" ]; then
    echo "push $msg to $mqpushurl ok !"
  else
    echo "push $msg to $mqpushurl failed !"
  fi
  echo "</br><a href="/view/studenttask/vmlist.jsp">返回列表</a>"
  exit
fi

# 开启虚拟机（同时开启其网关路由器）
if [ "$action" == "start" ]; then
  vmnametmp=$vmname
  startvm $user_id $user_name $user_name
  startvm $user_id $user_name $vmnametmp
# 关闭虚拟机
elif [ "$action" == "destroy" ]; then
  destroyvm $vmname
# 重置虚拟机
elif [ "$action" == "resetvm" ]; then
  resetvm $centos
elif [ "$type" == "ubuntu" ]; then
  resetvm $ubuntu
# 虚拟机连接信息
elif [ "$action" == "connect" ]; then
  connectvm $vmname
fi

echo "</br>"
echo "<a href="/view/studenttask/vmlist.jsp">返回列表</a>"
