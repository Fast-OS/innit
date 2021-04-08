#!/bin/bash
mount -o nosuid,noexec,nodev -t proc proc /proc
mount -o nosuid,noexec,nodev -t sysfs sys /sys
mount -t efivarfs none /sys/firmware/efi/efivars
mount -o mode=0755,nosuid,nodev -t tmpfs run /run
mount -o mode=0755,nosuid -t devtmpfs dev /dev
mkdir /run /run/runit /run/dbus /run/lvm /run/user /run/lock /run/log /run/pts /dev/shm /dev/pts
chmod 755 /run /run/runit /run/lvm /run/dbus /run/user /run/lock /run/log /run/pts /dev/shm /dev/pts