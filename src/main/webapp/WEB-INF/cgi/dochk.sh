#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

# 环境操作，包含恢复、查看详情
source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# QUERY_STRING="user_id=151&action=mark&class_id=3&date_time=2023-08-02"
# 获取学生ID和事件
user_id=$(echo $QUERY_STRING | awk -F "&" '{print $1}' | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | awk -F "&" '{print $2}' | awk -F "=" '{print $2}')
class_id=$(echo $QUERY_STRING | awk -F "&" '{print $3}' | awk -F "=" '{print $2}')
date_time=$(echo $QUERY_STRING | awk -F "&" '{print $4}' | awk -F "=" '{print $2}')

test -z "$class_id" && class_id=11
test -z "$date_time" && date_time=$(date +"%Y-%m-%d")

if [ "$action" == "mark" ]; then    # 签到
  # 更新数据库中时间戳为0并且ID为此学生的签到记录
  $mysqllogin "UPDATE lab_chk SET state=1, time=UNIX_TIMESTAMP() WHERE user_id=$user_id"
elif [ "$action" == "delay" ]; then # 迟到
  $mysqllogin "UPDATE lab_chk SET state=2, time=UNIX_TIMESTAMP() WHERE user_id=$user_id"
elif [ "$action" == "leave" ]; then # 旷课
  $mysqllogin "UPDATE lab_chk SET state=3, time=UNIX_TIMESTAMP() WHERE user_id=$user_id"
elif [ "$action" == "thing" ]; then # 事假
  $mysqllogin "UPDATE lab_chk SET state=4, time=UNIX_TIMESTAMP() WHERE user_id=$user_id"
elif [ "$action" == "ill" ]; then   # 病假
  $mysqllogin "UPDATE lab_chk SET state=5, time=UNIX_TIMESTAMP() WHERE user_id=$user_id"
fi

# 以XCO格式返回虚拟机状态列表
echo -n '<?xml version="1.0" encoding="UTF-8"?>'
echo -n '<X><L K="total" V="18"/><XL K="data">'

# 接收学生ID，查询用户名
begints=$(date +%s -d "$date_time")
endts=$(echo $begints + 86400 | bc)
chklist=$($mysqllogin "select lab_user.user_id, lab_user.user_name, lab_user.real_name, lab_user.class_name, DATE_FORMAT(FROM_UNIXTIME(lab_chk.time), '%Y-%m-%d_%H:%i'), lab_chk.state from lab_chk join lab_user on lab_chk.user_id=lab_user.user_id where lab_user.class_id=$class_id and lab_chk.time between $begints and $endts;" | grep -v user | sed "s/\t/@/g")

for chk in ${chklist[@]}; do
  user_id=$(echo $chk | awk -F "@" '{print $1}')
  user_name=$(echo $chk | awk -F "@" '{print $2}')
  real_name=$(echo $chk | awk -F "@" '{print $3}')
  class_name=$(echo $chk | awk -F "@" '{print $4}')
  time=$(echo $chk | awk -F "@" '{print $5}')
  state=$(echo $chk | awk -F "@" '{print $6}')
  # 以XCO格式拼接数据
  echo -n "<X><S K=\"user_id\" V=\"$user_id\"/><S K=\"user_name\" V=\"$user_name\"/><S K=\"real_name\" V=\"$real_name\"/><S K=\"class_name\" V=\"$class_name\"/><S K=\"time\" V=\"$time\"/><S K=\"state\" V=\"$state\"/></X>"
done

echo -n '</XL></X>'
