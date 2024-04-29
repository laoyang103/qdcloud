#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

ROOTFS_DISK_PATH=$1
ROOTFS_DISK_SIZE=$2

if [ ! -e "$ROOTFS_DISK_PATH" ]; then
  truncate -s $ROOTFS_DISK_SIZE $ROOTFS_DISK_PATH
  mkfs.ext4 -d /rootfs $ROOTFS_DISK_PATH
  echo "$ROOTFS_DISK_PATH not exist, create ..."
else
  echo "$ROOTFS_DISK_PATH exist, not create ..."
fi
