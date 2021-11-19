#include <stdio.h>

#define RED(s) "\e[0;32m"s"\e[0m"

int main(void) {
	printf("%s World!\n", RED("Hello"));
}
