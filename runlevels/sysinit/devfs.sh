#!/bin/bash
ln -snf /proc/self/fd /dev/fd
ln -snf /proc/self/fd/0 /dev/stdin
ln -snf /proc/self/fd/1 /dev/stdout
ln -snf /proc/self/fd/2 /dev/stderr
ln -snf /proc/kcore /dev/core
chmod -R 777 /dev
