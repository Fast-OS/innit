#include <stdio.h>
#include <stdlib.h>

int main() {
	int status;
	BashInit();
	shell();
}
void shell() {
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
}
int BashInit() {
	int status;
	if (fork() == 0) {
		execve("/etc/init.d/init.sh", NULL, NULL);
	}
	else {
		wait(&status);
	}
	if (WIFEXITED(status)) {
		return 0;
	}
}