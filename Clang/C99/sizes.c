#include <stdio.h>

void printString(char *string) {
	while(*string != '\0') {
		printf("%c", *string++);
	}
}
