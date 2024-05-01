#!/bin/bash

# 环境变量编码类型、命令路径
export LANG="en_US.UTF-8"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin"
export KUBECONFIG="/root/.kube/config"

# k8s系统命名空间
ksys="kubectl -n kube-system"

# vpc网关容器前缀
gwprefix="vpc-nat-gw-gateway"

# 当前时间和日志文件路径
time_stamp=`date "+%Y-%m-%d %T"`
log_file="/var/log/qdcloud"

# 检查iptables规则的临时文件
currfile="/tmp/iptables-curr.txt"

# 每个客户端的VPN配置目录
ccddir="/etc/openvpn/ccd/"

# 学生资源清单配置目录
hpvdiskdir="/var/lib/qdcloud/"

# 管理中心数据库的登陆信息
mysqllogin="mysql --default-character-set=utf8 -h127.0.0.1 -uroot -p123456 jxcms -e "

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
vminfo=$($mysqllogin "select name,ipaddr,type from lab_vm" | grep -v name | sed "s/\t/@/g")
vmList=$(echo $vminfo | sed "s/ /\n/g" | xargs)
vmipList=$(echo $vminfo | sed "s/ /\n/g" | awk -F "@" '{print $2}' | xargs)

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

# 传递学生ID、创建学生环境
function mkenv() {
  user_name=$1
  user_id=$($mysqllogin "select user_id from lab_user where user_name='$user_name'" | grep -v user_id)
  vmrip=$(num2ip $(echo $vmrbase + $user_id*4 - 2 | bc))
  
  # 删除用户环境
  rm -rf $hpvdiskdir/$user_name
  mkdir -p $hpvdiskdir/$user_name/pod
  cp -r yml/template/*.yml $hpvdiskdir/$user_name/
  
  # 替换路由器IP、用户名
  sed -i "s/__user_vmr/$vmrip/g" $hpvdiskdir/$user_name/*.yml
  sed -i "s/__user_name/$user_name/g" $hpvdiskdir/$user_name/*.yml
  
  # 尝试创建VPC、子网、网关
  echo "### create gateway pod ..."
  kubectl apply -f $hpvdiskdir/$user_name/vpc-subnet.yml
  kubectl apply -f $hpvdiskdir/$user_name/gateway.yml
  kubectl apply -f $hpvdiskdir/$user_name/nat.yml
  
  # 等待网关创建，获取网关所在node（因为实验pod要和网关pod在相同节点）
  echo "### get gateway pod node ..."
  gwnode=""
  while true; do
    gwnode=$($ksys get pod/$gwprefix-$user_name-0 -o yaml | grep nodeName | awk '{print $2}')
    test -n "$gwnode" && break
  done
  
  # 修改网关yml文件中节点选择为上面获取节点，保证不再变动
  echo "### gateway $gwprefix-$user_name-0 node is $gwnode ..."
  sed -i "s@kubernetes.io/os: linux@kubernetes.io/hostname: $gwnode@g" $hpvdiskdir/$user_name/gateway.yml
  
  # 创建每个实验Pod的yml并绑定到网关所在的node
  echo "### create yml(not create pod) on $gwnode"
  for vminfo in ${vmList[@]}; do
    vmname=$(echo $vminfo | awk -F "@" '{print $1}' | sed "s/jx-//g" | sed "s/^/$user_name-/g")
    vmaddr=$(echo $vminfo | awk -F "@" '{print $2}')
    vmtype=$(echo $vminfo | awk -F "@" '{print $3}')
    vmaddrnf=$(echo $vmaddr | awk -F "." '{print $4}')
  
    # 根据类型创建虚拟机或者容器
    if [ "$vmtype" == "vm" ]; then
      # 如果是虚拟机则创建PVC
      sed -i "s/__vmname/$vmname/g" $hpvdiskdir/$user_name/pvc.yml
      kubectl apply -f $hpvdiskdir/$user_name/pvc.yml
      cp $hpvdiskdir/$user_name/pod-vm.yml $hpvdiskdir/$user_name/pod/$vmname.yml 
    else
      cp $hpvdiskdir/$user_name/pod-container.yml $hpvdiskdir/$user_name/pod/$vmname.yml 
    fi
  
    sed -i "s/__vmname/$vmname/g" $hpvdiskdir/$user_name/pod/$vmname.yml
    sed -i "s/__fix_ipaddress_all/$vmaddr/g" $hpvdiskdir/$user_name/pod/$vmname.yml
    sed -i "s/__fix_ipaddress_nf/$vmaddrnf/g" $hpvdiskdir/$user_name/pod/$vmname.yml
    sed -i "s/__select_node/$gwnode/g" $hpvdiskdir/$user_name/pod/$vmname.yml
    echo "create $hpvdiskdir/$user_name/pod/$vmname.yml"
  done
  
  # 删除临时文件
  rm $hpvdiskdir/$user_name/pod-*.yml
}

# 传递学生ID、学生用户名
function startvm() {
  vm=$1
  user_name=$2

  # 如果没有命名空间，则创建环境（VPC、子网、网关...）
  if [ ! -e "$hpvdiskdir/$user_name" ]; then
    mkenv $user_name
  fi

  # 等待网关容器就绪
  while [ -z "$($ksys get pod/$gwprefix-$user_name-0 | grep Running | grep -v grep)" ]; do
    echo "wait for pod/$gwprefix-$user_name-0 Running ..."
    sleep 5
  done

  # 创建目标Pod
  kubectl apply -f $hpvdiskdir/$user_name/pod/$vm.yml
}

# 查询某个虚拟机的状态，传递虚拟机名字，用户名
function statevm() {
  vmname=$1
  user_name=$2
  if [ -n "$(echo $vmname | grep vpc | grep -v grep)" ]; then
    state=$($ksys get pod/$vmname > /dev/null && echo running || echo shut)
  else
    state=$(kubectl -n ns-$user_name get pod/$vmname > /dev/null && echo running || echo shut)
  fi
  echo $state
}

# 关闭某个虚拟机，传递虚拟机名字
function destroyvm() {
  vmname=$1
  user_name=$2
  kubectl -n ns-$user_name delete pod/$vmname
}

# 重置某个虚拟机，实际是关闭后覆盖虚拟磁盘，传递虚拟机名字
function resetvm() {
  vmname=$1
  user_name=$2
  kubectl -n ns-$user_name delete pod/$vmname
  kubectl -n ns-$user_name delete pvc $vmname-pvc
}
