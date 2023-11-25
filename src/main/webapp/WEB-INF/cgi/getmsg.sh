#!/bin/bash 

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# 如果获取不到可用区域名，则是管理中心，不拉取任务执行
if [ -z "$regiondomain" -a -z "$regionwebport" ]; then
  echo "not a region will not pull msg from $mqpullurl"
  exit
fi

mqpullurl=$(echo $mqpullurl  | sed "s/__region_queue_name/$regiondomain/g")
mqpullreq=$(echo $mqpulltmpl | sed "s/__region_queue_name/$regiondomain/g")
echo "pull msg with $mqpullurl $mqpullreq"

while true; do
  msg=$(curl -u $mqlogin $mqpullurl -d "$mqpullreq")
  echo "pulled msg $msg"
  
  param=$(echo $msg | jq ".[].payload" | sed "s/\"//g")
  echo "pulled msg payload is $param"
  
  if [ -n "$param" ]; then
    echo "call curl with http://localhost:$regionwebport/cgi-bin/dovm.sh?$param"
    curl http://localhost:$regionwebport/cgi-bin/dovm.sh?$param
  else
    echo "no msg payload is $msg"
  fi

  sleep 3
done
