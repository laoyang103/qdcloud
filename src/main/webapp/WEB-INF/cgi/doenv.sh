#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh
source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/table-css.sh

# QUERY_STRING="user_name=jx00000003&path=env-errip-21&action=detail"
user_name=$(echo $QUERY_STRING | awk -F "&" '{print $1}' | awk -F "=" '{print $2}')
path=$(echo $QUERY_STRING | awk -F "&" '{print $2}' | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | awk -F "&" '{print $3}' | awk -F "=" '{print $2}')

diskList=$(ls $vdiskdir/stuenv/$path)
if [ "$action" == "revert" ]; then
  haverevrt=$(ps aux | grep $user_name | grep $disk | grep -v grep | head -n 1)
  if [ -n "$haverevrt" ]; then
    echo "$vmname is reverting, please wait ... </br>"
    echo "</br>"
    echo "<a href="/view/studenttask/envlist.jsp">返回列表</a>"
    exit
  fi
  for disk in ${diskList[@]}; do
    vmname=$user_name"-"$(echo $disk | sed "s/jx-//g" | sed "s/.qcow2//g")
    destroyvm $vmname
    rm $vdiskdir/$user_name/$disk
    cp $vdiskdir/stuenv/$path/$disk $vdiskdir/$user_name/
    echo "destroy $vmname and copy $path/$disk to $user_name/$disk ... </br>"
  done
elif [ "$action" == "detail" ]; then
  envinfo=$($mysqllogin "select *from lab_env where path='$path'" | grep -v id | sed "s/\t/@/g")
  title=$(echo $envinfo | awk -F "@" '{print $4}')
  describe=$(echo $envinfo | awk -F "@" '{print $5}')
  echo "<h1>环境名称：$title</h1>"
  echo "<h2>需要重置的虚拟机列表</h2>"
  echo "<table border=\"1\">"
  echo "  <tr>"
  echo "    <th>虚拟机名称</th>"
  echo "    <th>虚拟磁盘</th>"
  echo "  </tr>"
  for disk in ${diskList[@]}; do
    vmname=$user_name"-"$(echo $disk | sed "s/jx-//g" | sed "s/.qcow2//g")
    echo "<tr>"
    echo "  <th>$vmname</th>"
    echo "  <th>$disk</th>"
    echo "</tr>"
  done
fi
echo "</table>"
echo "<h2>环境描述：$describe</h2>"

echo "</br>"
echo "<a href="/view/studenttask/envlist.jsp">返回列表</a>"
