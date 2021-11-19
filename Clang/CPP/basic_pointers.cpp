#include <cstdio>

int main(void) {
	int var{};
	int *var_addr = &var;
	// Address space layout randomization 
	// vs return oriented programming
	printf("var: %d\n", var);
	printf("&var: %p\n", var_addr);

	char lower[] = "abc?e";
	char upper[] = "ABC?E";
	char* upper_ptr = upper; // Equivalent: &upper[0]
	
	// *(lower + 3) = 'd';
	lower[3] = 'd';
	upper_ptr[3] = 'D';

	char letter_d = lower[3];
	char letter_D = upper_ptr[3];

	printf("lower: %s\nupper: %s\n", lower, upper);
	return 0;
}

