#!/bin/bash

source head.sh

user_name=$1
user_id=$($mysqllogin "select user_id from lab_user where user_name=$user_name" | grep -v user_id)
vmrip=$(num2ip $(echo $vmrbase + $user_id*4 - 2 | bc))

cp -r yml/template $hpvdiskdir/$user_name
sed -i "s/__user_vmr/$vmrip/g" $hpvdiskdir/$user_name/*.yml
sed -i "s/__user_name/$user_name/g" $hpvdiskdir/$user_name/*.yml
kubectl apply -f $hpvdiskdir/$user_name/vpc-subnet.yml
kubectl apply -f $hpvdiskdir/$user_name/gateway.yml
kubectl apply -f $hpvdiskdir/$user_name/nat.yml

for vm in ${vmList[@]}; do
  vmname=$(echo $vm | sed "s/jx-//g" | sed "s/^/$user_name-/g")
  ipaddr="10.10.10.$(echo $vm | awk -F "-" '{print $NF}')"
  cp $hpvdiskdir/$user_name/pod.yml $hpvdiskdir/$user_name/$vmname.yml 
  sed -i "s/__vmname/$vmname/g" $hpvdiskdir/$user_name/$vmname.yml
  sed -i "s/__fix_ipaddress/$ipaddr/g" $hpvdiskdir/$user_name/$vmname.yml
  echo "kubectl apply -f $hpvdiskdir/$user_name/$vmname.yml"
done
