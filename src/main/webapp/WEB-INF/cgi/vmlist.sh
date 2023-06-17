#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Connection: keep-alive"
echo "Content-Type: text/xml;charset=utf-8"
echo ""

source head.sh

echo -n '<?xml version="1.0" encoding="UTF-8"?>'
echo -n '<X><L K="total" V="18"/><XL K="data">'

user_id=$(echo $QUERY_STRING | awk -F "=" '{print $2}')
user_name=$($mysqllogin "select user_name from lab_user where user_id=$user_id" | grep -v user_name)

for vm in ${vmList[@]}; do
  vm=$(echo $vm | sed "s/jx-//g" | sed "s/^/$user_name-/g")
  state=$(statevm $vm)
  echo -n "<X><S K=\"vmname\" V=\"$vm\"/><S K=\"state\" V=\"$state\"/></X>"
done

echo -n '</XL></X>'

# echo '<?xml version="1.0" encoding="UTF-8"?><X><L K="total" V="1"/><XL K="data"><X><L K="role_id" V="1"/><S K="role_name" V="学生角色"/><S K="role_description" V=""/><I K="state" V="0"/><A K="create_time" V="2016-11-11 11:11:11"/><A K="update_time" V="2016-10-03 10:55:17"/><I K="version" V="0"/></X></XL></X>'
