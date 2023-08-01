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
class_id=$(echo $QUERY_STRING | awk -F "=" '{print $2}')
test -z "$class_id" && class_id=1
chklist=$(mysql --default-character-set=utf8 -uroot -p123456 jxcms -e "select lab_user.user_id, lab_user.user_name, lab_user.real_name, lab_user.class_name, lab_check.time, lab_check.state from lab_check join lab_user on lab_check.user_id=lab_user.user_id where lab_user.class_id=$class_id;" | grep -v user | sed "s/\t/@/g")

for chk in ${chklist[@]}; do
  user_id=$(echo $chk | awk -F "@" '{print $1}')
  user_name=$(echo $chk | awk -F "@" '{print $2}')
  real_name=$(echo $chk | awk -F "@" '{print $3}')
  class_name=$(echo $chk | awk -F "@" '{print $4}')
  time=$(echo $chk | awk -F "@" '{print $5}')
  state=$(echo $chk | awk -F "@" '{print $6}')
  # 以XCO格式拼接数据
  echo -n "<X><S K=\"user_id\" V=\"$userid\"/><S K=\"user_name\" V=\"$user_name\"/><S K=\"real_name\" V=\"$real_name\"/><S K=\"class_name\" V=\"$class_name\"/><S K=\"time\" V=\"$time\"/><S K=\"state\" V=\"$state\"/></X>"
done

echo -n '</XL></X>'

# echo '<?xml version="1.0" encoding="UTF-8"?><X><L K="total" V="1"/><XL K="data"><X><L K="role_id" V="1"/><S K="role_name" V="学生角色"/><S K="role_description" V=""/><I K="state" V="0"/><A K="create_time" V="2016-11-11 11:11:11"/><A K="update_time" V="2016-10-03 10:55:17"/><I K="version" V="0"/></X></XL></X>'
