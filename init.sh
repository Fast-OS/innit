#!/bin/bash
mount -o nosuid,noexec,nodev -t proc proc /proc
mount -o nosuid,noexec,nodev -t sysfs sys /sys
mount -t efivarfs none /sys/firmware/efi/efivars
mount -o mode=0755,nosuid,nodev -t tmpfs run /run
mount -o mode=0755,nosuid -t devtmpfs dev /dev
mkdir /run /run/runit /run/dbus /run/lvm /run/user /run/lock /run/log /run/pts /dev/shm /dev/pts
chmod 755 /run /run/runit /run/lvm /run/dbus /run/user /run/lock /run/log /run/pts /dev/shm /dev/pts
udevd --daemon
udevadm trigger --attr-match=dev --action=add
udevadm trigger --subsystem-match=net --action=add
udevadm trigger --type=subsystems --action=add
udevadm trigger --type=devices --action=add
ln -snf /proc/self/fd /dev/fd
ln -snf /proc/self/fd/0 /dev/stdin
ln -snf /proc/self/fd/1 /dev/stdout
ln -snf /proc/self/fd/2 /dev/stderr
ln -snf /proc/kcore /dev/core
mkdir /run /run/runit /run/dbus /run/lvm /run/user /run/lock /run/log /run/pts /dev/shm /dev/pts
chmod 755 /run /run/runit /run/lvm /run/dbus /run/user /run/lock /run/log /run/pts /dev/shm /dev/pts
mount -o mode=0620,gid=5,nosuid -nt devpts devpts /dev/pts
mount -o mode=0777,nosuid,nodev -nt tmpfs shm /dev/shm
dd count=1 bs=512 if=/dev/random of=/var/random.seed
dbus-daemon --system
sysctl -p /etc/sysctl.conf
mount -o rw,remount /usr
mount -n -o remount,rw /
mount -a
swapon -a
syslogd
ip link set up dev lo
modprobe 88x2bu
wpa_supplicant -B -c /etc/wifi -i wlp0s20f0u4
dhcpcd
hostname -v A-PC
bash export TERM="xterm"
chown :tty /dev/tty*
chmod -R 777 /dev/*
