#!/bin/bash
mount -o rw,remount /usr
mount -n -o remount,rw /
mount -a
swapon -a
chown :tty /dev/tty*
chmod -R 777 /dev/*