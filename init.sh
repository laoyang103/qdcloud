#!/bin/bash

/opt/tomcat8/bin/startup.sh

confpath="/opt/tomcat8/webapps/R00T/WEB-INF/classes/tangyuan-configuration.xml"

while [ ! -e "$confpath" ]; do
  sleep 3
done

#根据环境变量替换数据库地址
sed -i "s/127.0.0.1/$MYSQL_ADDR/g" $confpath
sed -i "s/root/$MYSQL_USER/g" $confpath
sed -i "s/123456/$MYSQL_PASS/g" $confpath
sed -i "s/jxcms/$MYSQL_NAME/g" $confpath

