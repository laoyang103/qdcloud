#!/bin/bash 

source head.sh

action=$1

if [ "list" == "$action" ]; then
  for hpv in ${hpvList[@]}; do
    echo "======================= vm in $hpv ============================="
    virsh -c qemu+tcp://$hpv/system list | grep -v Name | grep -v "\-\-\-"
  done
elif [ "destroy" == "$action" ]; then
  for hpv in ${hpvList[@]}; do
    echo "======================= vm in $hpv ============================="
    vmlist=$(virsh -c qemu+tcp://$hpv/system list | grep -v Name | grep -v "\-\-\-" | awk '{print $2}')
    for vm in ${vmlist[@]}; do
      virsh -c qemu+tcp://$hpv/system destroy $vm
    done
  done
fi
