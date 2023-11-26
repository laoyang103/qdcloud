#!/bin/bash 

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh

# 如果获取不到可用区域名，则是管理中心，不拉取任务执行
if [ -z "$regiondomain" -a -z "$regionwebport" ]; then
  echo "$time_stamp $0: not a region will not pull msg from $mqpullurl" >> $log_file
  exit
fi

mqpullurl=$(echo $mqpullurl  | sed "s/__region_queue_name/$regiondomain/g")
mqpullreq=$(echo $mqpulltmpl | sed "s/__region_queue_name/$regiondomain/g")
echo "$time_stamp $0: pull msg with $mqpullurl $mqpullreq" >> $log_file

while true; do
  msg=$(curl -s -u $mqlogin $mqpullurl -d "$mqpullreq" | grep payload | grep -v grep)
  if [ -z "$msg" ]; then
    sleep 3
    continue;
  fi

  echo "$time_stamp $0: pulled msg $msg" >> $log_file

  param=$(echo $msg | jq ".[].payload" | sed "s/\"//g")
  echo "$time_stamp $0: pulled msg payload is $param" >> $log_file
  echo "$time_stamp $0: call curl with http://localhost:$regionwebport/cgi-bin/dovm.sh?$param" >> $log_file
  curl -s http://localhost:$regionwebport/cgi-bin/dovm.sh?$param

done
