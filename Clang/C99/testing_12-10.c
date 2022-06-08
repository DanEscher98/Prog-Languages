#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

uint16_t sign_extend(uint16_t x, int bit_count)
{
	if ((x >> (bit_count - 1)) & 1) {
		x |= (0xFFFF << bit_count);
	}
	return x;
}

enum { A, B, C, D = 5 };

int main(void)
{
	int n = 0b11110;
	printf("sign_extend(%d, %d) = %d\n", n, 5, sign_extend(n, 5));
	printf("64 >> 2: %d\n", 64 >> 2);
	int a = 15, b = 15;
	a |= 16;
	b &= 10;
	printf("a = %d\n", a);
	printf("b = %d\n", b);

	printf("A: %d", A);
	printf("B: %d", B);
	printf("C: %d", C);
	printf("D: %d", D);

	return EXIT_SUCCESS;
}
