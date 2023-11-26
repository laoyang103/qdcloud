#!/bin/bash

# 环境变量编码类型、命令路径
export LANG="en_US.UTF-8"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin"

# 当前时间和日志文件路径
time_stamp=`date "+%Y-%m-%d %T"`
log_file="/var/log/qdcloud"

# 检查iptables规则的临时文件
currfile="/tmp/iptables-curr.txt"

# 每个客户端的VPN配置目录
ccddir="/etc/openvpn/ccd/"

# 计算节点虚拟磁盘目录（NFS映射到管理节点的/data/vdisk）
hpvdiskdir="/var/lib/libvirt/images/"

# 管理中心数据库的登陆信息
mysqllogin="mysql --default-character-set=utf8 -hdb.jxit.net.cn -ujxadmin -p jxcms -e "

# 管理中心MQ登录用户名密码
mqlogin="guest:guest" 

# 推送消息到管理中心MQ的URL
mqpushurl="http://mq.jxit.net.cn:15672/api/exchanges/%2F/amq.default/publish"

# 推送消息到管理中心MQ的消息模板，需要替换__region_queue_name队列名和__msg消息内容
mqpushtmpl="{\"vhost\":\"/\",\"name\":\"amq.default\",\"properties\":{\"delivery_mode\":1,\"headers\":{}},\"routing_key\":\"__region_queue_name\",\"delivery_mode\":\"1\",\"payload\":\"__msg\",\"payload_encoding\":\"string\",\"headers\":{},\"props\":{}}"

# 从管理中心MQ获取消息URL，需要替换__region_queue_name为队列名
mqpullurl="http://mq.jxit.net.cn:15672/api/queues/%2F/__region_queue_name/get"

# 拉取管理中心MQ中__region_queue_name队列的一条消息
mqpulltmpl="{\"vhost\":\"/\",\"name\":\"__region_queue_name\",\"truncate\":\"50000\",\"ackmode\":\"ack_requeue_false\",\"encoding\":\"auto\",\"count\":\"1\"}"

# 本机对外通信网卡（有网关的网卡）
localnic=$(ip r | grep default | awk '{print $5}' | head -n 1)
localmac=$(ip link show $localnic | grep ether | awk '{print $2}')

# 根据MAC地址是否在可用区表，确定是管理中心还是可用区主节点，并获取可用区ID
regioninfo=$($mysqllogin "select concat(id, ':', domain, ':', webport, ':', vpnport) from lab_region where mac='$localmac'" | grep -v id | head -n 1)
regionid=$(echo $regioninfo | awk -F ":" '{print $1}')
regiondomain=$(echo $regioninfo | awk -F ":" '{print $2}')
regionwebport=$(echo $regioninfo | awk -F ":" '{print $3}')
regionvpnport=$(echo $regioninfo | awk -F ":" '{print $4}')

# 计算节点桥接到计算集群交换机网桥名称
vmrbr="br-vmr"

# 所有虚拟机MAC地址的前三个十六进制
vmmacpre="92:10:25"

# 管理节点的对内IP地址，10.16.255.254/16，是所有计算节点和学生路由器的网关
vmrgate=10.16.255.254 

# 学生路由器的WAN口起始IP地址，网段为10.16.0.0/16，通过计算节点的br-vmr接入计算集群交换机
# 学生路由器的LAN口IP地址固定为10.10.10.254，作为后面jx-nginx-11（10.10.10.11）...的网关
# 学生路由器的WAN口的IP地址根据学生再数据库中的ID来固定分配，具体算法为
# vmrip=$(num2ip $(echo $vmrbase + $stuid*4 - 2 | bc))
# 10.16.0.0   10.16.0.2/10.16.0.6/10.16.0.10/10.16.0.14/10.16.0.18/...
vmrbase=168820736

# 学生连接到管理节点VPN后分配的固定IP，根据学生ID磊固定分配，具体算法为
# vpnip=$(num2ip $(echo $vpnbase + $stuid*4 - 2 | bc))
# 10.32.0.0   10.32.0.2/10.32.0.6/10.32.0.10/10.32.0.14/10.32.0.18/...
vpnbase=169869312

# 学生路由器后面的虚拟机列表jx-nginx-11、jx-nginx-12.....
# 学生路由器后面的虚拟机的IP列表10.10.10.11、10.10.10.12.....
vminfo=$($mysqllogin "select name,ipaddr from lab_vm" | grep -v name | sed "s/\t/@/g")
vmList=$(echo $vminfo | sed "s/ /\n/g" | awk -F "@" '{print $1}' | xargs)
vmipList=$(echo $vminfo | sed "s/ /\n/g" | awk -F "@" '{print $2}' | xargs)

# 根据可用区ID获取计算节点的IP列表，第一个计算节点的IP，主节点要被所有计算节点ssh信任
hpvList=$($mysqllogin "select ip from lab_region_hpv where region_id=$regionid" | grep -v ip)
hpvFirst=$(echo $hpvList | awk '{print $1}')

# 管理节点存放所有虚拟机虚拟磁盘的目录
vdiskdir="/data/vdisk/"

# 管理节点存放学生路由器虚拟磁盘的目录，所有学生路由器也是虚拟机
# 生成某个学生路由器时，会拷贝磁盘并根据学生ID修改其WAN口IP
# vmrip=$(num2ip $(echo $vmrbase + $stuid*4 - 2 | bc))
vdiskvmr="$vdiskdir/mbvmr.qcow2"

# 学生路由器WAN口IP的配置文件路径
vdiskipcfg="/etc/sysconfig/network-scripts/ifcfg-eth1"

# 将整数IP地址转为点分十进制
function num2ip() {
  $mysqllogin "select inet_ntoa(\"$1\")" | grep -v inet_ntoa
}

# 将点分十进制IP地址转为整数
function ip2num() {
  $mysqllogin "select inet_aton(\"$1\")" | grep -v inet_aton
}

# 在管理节点根据某个学生的路由器WAN口IP和VPN客户端IP生成端口映射
# 目前只映射所有虚拟机的80和22端口，比如jx-nginx-11的22端口：
# 10.32.0.2（VPN客户端） -> 10.10.10.11:22（VPN隧道口）
# ->              管理节点iptables 端口映射         ->
# 10.32.0.2（VPN客户端） -> 10.16.0.2:1122（路由器WAN口）
# 10.32.0.2（VPN客户端） -> 10.10.10.11:22（路由器LAN口）
function addrule() {
  stuipn=$1
  stuvpn=$2
  for vmip in ${vmipList[@]}; do
    ip4=$(echo $vmip | awk -F "." '{print $4}')
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination $stuipn:$ip4"22"
    iptables -t nat -A PREROUTING -s $stuvpn/32 -d $vmip/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination $stuipn:$ip4"80"
  done
}

# 在所有计算节点添加某个学生的VXLAN跨界点网桥，传递学生ID和用户名
# 网桥的名字格式为br-[学生用户名], vxlan口名字格式为vx-[学生用户名]
function addvxlan() {
  # 去所有宿主机检查学生vxlan网桥
  user_id=$1
  user_name=$2
  echo "check stu id $user_id name $user_name ..."
  for hpv in ${hpvList[@]}; do
    # 检查是否已经存在vxlan网桥
    havebr=$(ssh root@$hpv "brctl show br-$user_name | grep vx-$user_name | head -n 1")
    if [ -z "$havebr" ]; then
      # vxlan的隧道ID就是学生的ID
      ssh root@$hpv "ip link add vx-$user_name type vxlan id $user_id dstport 4789 group 239.1.1.1 dev br-vmr"
      ssh root@$hpv "brctl addbr br-$user_name"
      ssh root@$hpv "brctl addif br-$user_name vx-$user_name"
      ssh root@$hpv "ip l set vx-$user_name up"
      ssh root@$hpv "ip l set dev br-$user_name up"
    fi
  done
}

# 寻找一台最空闲的计算节点开启虚拟机，传递学生ID、学生用户名
function startvm() {
  user_id=$1
  user_name=$2
  vmname=$3
  # 开启之前先检查vxlan网桥
  addvxlan $user_id $user_name

  # 确定该虚拟机是否已经开启
  for hpv in ${hpvList[@]}; do
    state=$(virsh -c qemu+tcp://$hpv/system dominfo $vmname | grep State| awk '{print $2}')
    if [ "running" == "$state" ]; then
      echo "domain $vmname is running on $hpv ... </br>"
      return
    fi
  done

  # 寻找一台最空闲（虚拟机运行数最小）宿主机启动该虚拟机
  minhpv=$hpvFirst
  mincnt=$(ssh $hpvFirst free -g | grep Mem | awk '{print 100 - $7/$2*100}' | awk -F "." '{print $1}')
  for hpv in ${hpvList[@]}; do
    vcnt=$(ssh $hpv free -g | grep Mem | awk '{print 100 - $7/$2*100}' | awk -F "." '{print $1}')
    if [ $vcnt -lt $mincnt ]; then
      minhpv=$hpv
      mincnt=$vcnt
    fi
  done
  echo "starting $vmname on $minhpv (mem: %$mincnt)... </br>"
  echo "virsh -c qemu+tcp://$minhpv/system start $vmname </br>"
  virsh -c qemu+tcp://$minhpv/system start $vmname
}

# 查询某个虚拟机的状态，传递虚拟机名字
function statevm() {
  vmname=$1
  state="shut"
  for hpv in ${hpvList[@]}; do
    state=$(virsh -c qemu+tcp://$hpv/system dominfo $vmname | grep State| awk '{print $2}')
    if [ "running" == "$state" ]; then
      break
    fi
  done
  echo $state
}

# 关闭某个虚拟机，传递虚拟机名字
function destroyvm() {
  vmname=$1
  for hpv in ${hpvList[@]}; do
    virsh -c qemu+tcp://$hpv/system destroy $vmname
  done
}

# 重置某个虚拟机，实际是关闭后覆盖虚拟磁盘，传递虚拟机名字
function resetvm() {
  vmname=$1
  for hpv in ${hpvList[@]}; do
    virsh -c qemu+tcp://$hpv/system destroy $vmname
  done
  vmdisk=$(echo $vmname | sed "s/jx[0-9]\{8\}-/jx-/g" | sed "s/$/.qcow2/g")
  ssh root@10.16.255.253 rm $vdiskdir/$user_name/$vmdisk
  ssh root@10.16.255.253 cp $vdiskdir/stuvm/$vmdisk $vdiskdir/$user_name/$vmdisk
  echo "ssh root@10.16.255.253 rm $vdiskdir/$user_name/$vmdisk </br>"
  echo "ssh root@10.16.255.253 cp $vdiskdir/stuvm/$vmdisk $vdiskdir/$user_name/$vmdisk </br>"
}

# VNC连接某个虚拟机，会显示虚拟机所在计算节点IP和VNC监听端口
function connectvm() {
  vmname=$1
  for hpv in ${hpvList[@]}; do
    vncport=$(virsh -c qemu+tcp://$hpv/system vncdisplay $vmname | head -n 1 | sed "s/://g")
    if [ -n "$vncport" -a -n "$(echo $vncport | grep [0-9])" ]; then
      echo "<h1>虚拟机：$vmname</h1>"
      echo -n "<h1>以下需要通过VPN连接，<a href="/view/manual/jxvpn-wan.pdf">VPN安装教程</a></h1>"
      echo -n "<h2>IP地址：10.10.10.$(echo $vmname | awk -F "-" '{print $NF}')</h2>"
      echo "<h2>VNC地址：$hpv:$(echo $vncport + 5900 | bc)</h2>"
      break;
    fi
  done
}

