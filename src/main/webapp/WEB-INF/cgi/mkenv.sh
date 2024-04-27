#!/bin/bash

source head.sh

# 用户名、用户ID，路由器WAN口IP地址
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

# 删除临时资源，用户开启时再创建
kubectl delete -f $hpvdiskdir/$user_name/vpc-subnet.yml
kubectl delete -f $hpvdiskdir/$user_name/gateway.yml
kubectl delete -f $hpvdiskdir/$user_name/nat.yml

# 创建每个实验Pod的yml并绑定到网关所在的node
echo "### create yml(not create pod) on $gwnode"
for vminfo in ${vmList[@]}; do
  vmname=$(echo $vminfo | awk -F "@" '{print $1}' | sed "s/jx-//g" | sed "s/^/$user_name-/g")
  vmaddr=$(echo $vminfo | awk -F "@" '{print $2}')
  vmtype=$(echo $vminfo | awk -F "@" '{print $3}')
  vmaddrnf=$(echo $vmaddr | awk -F "." '{print $4}')

  # 根据类型创建虚拟机或者容器
  cp $hpvdiskdir/$user_name/pod-$vmtype.yml $hpvdiskdir/$user_name/pod/$vmname.yml 

  sed -i "s/__vmname/$vmname/g" $hpvdiskdir/$user_name/pod/$vmname.yml
  sed -i "s/__fix_ipaddress_all/$vmaddr/g" $hpvdiskdir/$user_name/pod/$vmname.yml
  sed -i "s/__fix_ipaddress_nf/$vmaddrnf/g" $hpvdiskdir/$user_name/pod/$vmname.yml
  sed -i "s/__select_node/$gwnode/g" $hpvdiskdir/$user_name/pod/$vmname.yml
  echo "create $hpvdiskdir/$user_name/pod/$vmname.yml"
done

# 删除临时文件
rm $hpvdiskdir/$user_name/pod-*.yml
