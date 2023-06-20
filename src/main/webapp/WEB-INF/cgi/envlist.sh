#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Connection: keep-alive"
echo "Content-Type: text/xml;charset=utf-8"
echo ""

source head.sh

echo -n '<?xml version="1.0" encoding="UTF-8"?>'
echo -n '<X><L K="total" V="6"/><XL K="data">'

user_id=$(echo $QUERY_STRING | awk -F "=" '{print $2}')
envList=$($mysqllogin "select *from lab_env" | grep -v path | sed "s/\t/@/g")

for env in ${envList[@]}; do
  id=$(echo $env | awk -F "@" '{print $1}')
  _type=$(echo $env | awk -F "@" '{print $2}')
  path=$(echo $env | awk -F "@" '{print $3}')
  title=$(echo $env | awk -F "@" '{print $4}')
  describe=$(echo $env | awk -F "@" '{print $5}')
  echo -n "<X><S K=\"title\" V=\"$title\"/><S K=\"path\" V=\"$path\"/><S K=\"type\" V=\"$_type\"/><S K=\"describe\" V=\"$describe\"/></X>"
done

echo -n '</XL></X>'

