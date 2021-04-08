#!/bin/bash
mount -o mode=0620,gid=5,nosuid -nt devpts devpts /dev/pts
mount -o mode=0777,nosuid,nodev -nt tmpfs shm /dev/shm