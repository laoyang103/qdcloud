#!/bin/bash 

source head.sh

date_time=$(date +"%Y-%m-%d")
# 接收学生ID，查询用户名
stulist=$($mysqllogin "select user_id from lab_user where user_id > 100")
for stu in ${stulist[@]}; do
  $mysqllogin "INSERT INTO lab_chk VALUES(NULL, $stu, $(date +%s -d "$date_time"), 0, '');"
done
