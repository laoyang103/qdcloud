#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Connection: keep-alive"
echo "Content-Type: text/xml;charset=utf-8"
echo ""

source head.sh

# 以XCO格式返回环境列表
echo -n '<?xml version="1.0" encoding="UTF-8"?>'
echo -n '<X><L K="total" V="6"/><XL K="data">'

# 接受学生的ID
user_id=$(echo $QUERY_STRING | awk -F "=" '{print $2}')
envList=$($mysqllogin "select *from lab_env" | grep -v path | sed "s/\t/@/g")

for env in ${envList[@]}; do
  # 环境的ID
  id=$(echo $env | awk -F "@" '{print $1}')
  # 环境的类型，0为错误环境，1为正确环境
  _type=$(echo $env | awk -F "@" '{print $2}')
  # 环境虚拟磁盘所在的目录名
  path=$(echo $env | awk -F "@" '{print $3}')
  # 环境的名字
  title=$(echo $env | awk -F "@" '{print $4}')
  # 环境的描述
  describe=$(echo $env | awk -F "@" '{print $5}')
  # 以XCO格式拼接返回数据
  echo -n "<X><S K=\"title\" V=\"$title\"/><S K=\"path\" V=\"$path\"/><S K=\"type\" V=\"$_type\"/><S K=\"describe\" V=\"$describe\"/></X>"
done

echo -n '</XL></X>'

