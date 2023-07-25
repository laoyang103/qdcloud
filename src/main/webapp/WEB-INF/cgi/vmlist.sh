#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Connection: keep-alive"
echo "Content-Type: text/xml;charset=utf-8"
echo ""

source head.sh

# 以XCO格式返回虚拟机状态列表
echo -n '<?xml version="1.0" encoding="UTF-8"?>'
echo -n '<X><L K="total" V="18"/><XL K="data">'

# 接收学生ID，查询用户名
user_id=$(echo $QUERY_STRING | awk -F "=" '{print $2}')
user_name=$($mysqllogin "select user_name from lab_user where user_id=$user_id" | grep -v user_name)

# 学生路由器
state=$(statevm $user_name)
vmrip=$(num2ip $(echo $vmrbase + $user_id*4 - 2 | bc))
echo -n "<X><S K=\"vmname\" V=\"$user_name\"/><S K=\"ipaddr\" V=\"$vmrip\"/><S K=\"state\" V=\"$state\"/></X>"

for vm in ${vmList[@]}; do
  vm=$(echo $vm | sed "s/jx-//g" | sed "s/^/$user_name-/g")
  ipaddr=$(echo $vm | awk -F "-" '{print $NF}')
  state=$(statevm $vm)
  # 以XCO格式拼接数据
  echo -n "<X><S K=\"vmname\" V=\"$vm\"/><S K=\"ipaddr\" V=\"10.10.10.$ipaddr\"/><S K=\"state\" V=\"$state\"/></X>"
done

echo -n '</XL></X>'

# echo '<?xml version="1.0" encoding="UTF-8"?><X><L K="total" V="1"/><XL K="data"><X><L K="role_id" V="1"/><S K="role_name" V="学生角色"/><S K="role_description" V=""/><I K="state" V="0"/><A K="create_time" V="2016-11-11 11:11:11"/><A K="update_time" V="2016-10-03 10:55:17"/><I K="version" V="0"/></X></XL></X>'
