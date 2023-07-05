#!/bin/bash


vmlist=(
"21.qcow2"
"22.qcow2"
"71.qcow2"
"76.qcow2"
"36.qcow2"
"31.qcow2"
"32.qcow2"
"37.qcow2"
"38.qcow2"
"11.qcow2"
"12.qcow2"
"13.qcow2"
"81.qcow2"
"51.qcow2"
"52.qcow2"
"26.qcow2"
"27.qcow2"
"28.qcow2"
"61.qcow2"
"41.qcow2"
)

for vm in ${vmlist[@]}; do
  ip=$(echo $vm | awk -F "." '{print $1}')
  disk=$(ls ../jx23000001 | grep $vm)
  qemu-img create -b /var/lib/libvirt/images/rocky9.qcow2 -F qcow2 -f qcow2 $disk
  guestmount -a $disk -m /dev/sda3 /mnt
  sed -i "s/10.10.10.11/10.10.10.$ip/g" /mnt/etc/NetworkManager/system-connections/ens3.nmconnection
  umount /mnt
done
