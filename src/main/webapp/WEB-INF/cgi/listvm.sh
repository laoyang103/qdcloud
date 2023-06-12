#!/bin/bash 

# REMOTE_ADDR="10.32.1.146"
echo "HTTP/1.1 200 OK"
echo "Content-Type: text/html;charset=utf-8"
echo ""

source head.sh

echo "<h1>虚拟系统管理器</h1>"
echo "<h2>用户名：$user_name</h2>"
echo "<table border=\"1\">"
echo "  <tr>"
echo "    <th>虚拟机名称</th>"
echo "    <th>状态</th>"
echo "    <th>操作</th>"
echo "  </tr>"

for vm in ${vmList[@]}; do
  echo "<tr>"
  echo "<td>$vm</td>"
  vm=$(echo $vm | sed "s/jx-//g" | sed "s/^/$user_name-/g")
  state=$(statevm $vm)
  if [ "running" == "$state" ]; then
    echo "<td><font color="green">已开启</font></td>"
    echo "<td>"
    echo "<a href="/cgi-bin/dovm.sh?name=$vm\&action=destroy">关闭</a>"
    echo "<a href="/cgi-bin/dovm.sh?name=$vm\&action=connect">连接</a>"
    echo "</td>"
  else 
    echo "<td><font color="red">已关闭</font></td>"
    echo "<td>"
    echo "<a href="/cgi-bin/dovm.sh?name=$vm\&action=start">开启</a>"
    echo "<a href="/cgi-bin/dovm.sh?name=$vm\&action=reset">重置</a>"
    echo "</td>"
  fi
  echo "</tr>"
done
echo "</table>"
