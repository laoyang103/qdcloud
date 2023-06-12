#!/bin/bash 

source head.sh

for hpv in ${hpvList[@]}; do
  echo "======================= vm in $hpv ============================="
  virsh -c qemu+tcp://$hpv/system list | grep -v Name | grep -v "\-\-\-"
done
