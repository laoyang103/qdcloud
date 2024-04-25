#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Connection: keep-alive"
echo "Content-Type: text/xml;charset=utf-8"
echo ""

source head.sh

# 接收学生ID，查询用户名
# QUERY_STRING="user_id=3"
user_id=$(echo $QUERY_STRING | awk -F "=" '{print $2}')
user_name=$($mysqllogin "select user_name from lab_user where user_id=$user_id" | grep -v user_name)

# 如果获取不到可用区域名，则是管理中心，根据学生所在可用区获取虚拟机列表
if [ -z "$regiondomain" -a -z "$regionwebport" ]; then
  # 获取学生所在可用区的域名和web端口
  regionhost=$($mysqllogin "select concat(lab_region.domain, ':', lab_region.webport) from lab_user join lab_region on lab_user.region=lab_region.id where lab_user.user_id=$user_id;" | grep -v webport)
  curl $regionhost/cgi-bin/vmlist.sh?$QUERY_STRING
  exit
fi

# 以XCO格式返回虚拟机状态列表
echo -n '<?xml version="1.0" encoding="UTF-8"?>'
echo -n '<X><L K="total" V="18"/><XL K="data">'

# 学生路由器
state=$(statevm $gwprefix-$user_name-0 $user_name)
vmrip=$(num2ip $(echo $vmrbase + $user_id*4 - 2 | bc))
echo -n "<X><S K=\"vmname\" V=\"$user_name\"/><S K=\"ipaddr\" V=\"$vmrip\"/><S K=\"state\" V=\"$state\"/></X>"

for vminfo in ${vmList[@]}; do
  vm=$(echo $vminfo | awk -F "@" '{print $1}' | sed "s/jx-//g" | sed "s/^/$user_name-/g")
  state=$(statevm $vm $user_name)
  ipaddr=$(echo $vm | awk -F "-" '{print $NF}')
  echo -n "<X><S K=\"vmname\" V=\"$vm\"/><S K=\"ipaddr\" V=\"10.10.10.$ipaddr\"/><S K=\"state\" V=\"$state\"/></X>"
done

echo -n '</XL></X>'
