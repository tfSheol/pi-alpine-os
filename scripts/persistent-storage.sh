#!/bin/sh

dd if=/dev/zero of=/media/mmcblk0p1/persist.img bs=1024 count=0 seek=1048576

apk add e2fsprogs

mkfs.ext4 /media/mmcblk0p1/persist.img

#echo "/media/mmcblk0p1/persist.img /media/persist ext4 rw,relatime 0 0" >> /etc/fstab
#mkdir /media/persist
mount -a

