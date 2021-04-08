CC=gcc
all:
	gcc -O3 -march=native -pipe -o init ./src/main.c
install:
	cp -r ./runlevels /etc/
	cp init /sbin
clean:
	rm -f init
