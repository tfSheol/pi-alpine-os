#!/bin/sh

mount /media/mmcblk0p1 -o rw,remount
sed -i 's/vfat\ ro,/vfat\ rw,' /etc/fstab

dd if=/dev/zero of=/media/mmcblk0p1/persist.img bs=4096 count=0 seek=1048576

apk add e2fsprogs

mkfs.ext4 /media/mmcblk0p1/persist.img

echo "/media/mmcblk0p1/persist.img /media/persist ext4 rw,relatime,errors=remount-ro 0 0" >> /etc/fstab
mkdir /media/persist
mount -a

