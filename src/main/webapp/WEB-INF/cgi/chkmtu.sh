#!/bin/bash

nic="/mnt/etc/sysconfig/network-scripts/ifcfg-eth0"

dlist=$(ls $1/*.qcow2)
for d in ${dlist[@]}; do
  guestmount -a $d -m /dev/sda1 /mnt
  havemtu=$(cat $nic | grep MTU | head -n 1)
  if [ -z "$havemtu" ]; then
    echo "set MTU=1300 ..."
    echo "MTU=1300" >> /mnt/etc/sysconfig/network-scripts/ifcfg-eth0
  else
    echo "found MTU, not set MTU=1300 ..."
  fi
  umount /mnt
done
