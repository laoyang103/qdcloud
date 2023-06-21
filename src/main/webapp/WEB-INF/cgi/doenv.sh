#!/bin/bash 

echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

# 环境操作，包含恢复、查看详情
source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/head.sh
source /opt/tomcat8/webapps/ROOT/WEB-INF/cgi/table-css.sh

# 接收学生用户名、环境虚拟磁盘目录名、动作
# QUERY_STRING="user_name=jx00000003&path=env-errip-21&action=detail"
user_name=$(echo $QUERY_STRING | awk -F "&" '{print $1}' | awk -F "=" '{print $2}')
path=$(echo $QUERY_STRING | awk -F "&" '{print $2}' | awk -F "=" '{print $2}')
action=$(echo $QUERY_STRING | awk -F "&" '{print $3}' | awk -F "=" '{print $2}')

# 该环境索包含的所有虚拟磁盘名称列表
diskList=$(ls $vdiskdir/stuenv/$path)
if [ "$action" == "revert" ]; then
  # 对于每个磁盘先关闭其对应虚拟机，再覆盖虚拟机磁盘
  for disk in ${diskList[@]}; do
    # 先关闭其对应虚拟机
    vmname=$user_name"-"$(echo $disk | sed "s/jx-//g" | sed "s/.qcow2//g")
    destroyvm $vmname
    # 再覆盖虚拟机磁盘
    rm $vdiskdir/$user_name/$disk
    cp $vdiskdir/stuenv/$path/$disk $vdiskdir/$user_name/
    echo "destroy $vmname and copy $path/$disk to $user_name/$disk ... </br>"
  done
elif [ "$action" == "detail" ]; then
  # 从数据库中查出该环境的所有信息
  envinfo=$($mysqllogin "select *from lab_env where path='$path'" | grep -v id | sed "s/\t/@/g")
  # 环境名称和描述
  title=$(echo $envinfo | awk -F "@" '{print $4}')
  describe=$(echo $envinfo | awk -F "@" '{print $5}')
  echo "<h1>环境名称：$title</h1>"
  echo "<h2>需要重置的虚拟机列表</h2>"
  echo "<table border=\"1\">"
  echo "  <tr>"
  echo "    <th>虚拟机名称</th>"
  echo "    <th>虚拟磁盘</th>"
  echo "  </tr>"
  # 显示该环境要覆盖的虚拟机列表
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
