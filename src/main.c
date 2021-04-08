#include <stdio.h>
#include <stdlib.h>

int main() {
	int runlevel = 1;
	if (runlevel == 0) {
		printf("DEBUG - 0");
		system("/etc/runlevels/shutdown/inst.sh");
	}
	if (runlevel == 1) {
		printf("DEBUG - 1");
		system("/etc/runlevels/sysinit/inst.sh");
		runlevel++;
	}
	if (runlevel == 2) {
		printf("DEBUG - 2");
		system("/etc/runlevels/boot/inst.sh");
		runlevel++;
	}
	if (runlevel == 3) {
		printf("DEBUG - 3");
		system("/etc/runlevels/nonetwork/inst.sh");
		runlevel++;
	}
	if (runlevel == 4) {
		printf("DEBUG - 4");
		system("/etc/runlevels/default/inst.sh");
	}
	else {
		printf("ERROR - TERMINATING NOW");
		return(0);
	}
	execve("/bin/sh", NULL, NULL);
}
/*void shell() {
	int status;
	if (fork() == 0 ) {
		execve("/bin/bash", NULL, NULL);
	}
	else {
		wait(&status);
	}
	if (WIFEXITED(status)) {
		shell();
	}
}*/ //causes odd issues with the shell if someone knows why please help
