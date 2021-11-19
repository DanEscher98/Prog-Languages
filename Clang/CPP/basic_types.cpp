#include <cstdio>
#include <cstddef>

enum class Race {
	Dinan,
	Teklan,
	Ivyn,
	Morian,
	Camite,
	Julian,
};

struct Book {
	char name[256];
	int year;
	int pages;
	bool hardcover;
};

union NumVariant {
	int integer;
	double floating;
};

int main(void) {
	// Unions
	NumVariant v;
	v.integer = 6;
	printf("A number: %d", v.integer);
	v.floating = 6.0221409e23;
	printf("Avogadro's Number: %le\n", v.floating);
	
	// Loop over an array
	int values[] = { 10, 50, 20, 30 };
	for (int value : values) {
		printf("Num: %d\n", value);
	}
	size_t lenA = sizeof(values)/sizeof(int);
	printf("Size: %zd\n", lenA);
	
	// Switch and enum functionality
	Race race = Race::Dinan;
	switch (race) {
		case Race::Dinan : {
			printf("You work hard.");
		} break;
		case Race::Teklan : {
			printf(" are very strong.");
		} break;
		default : {
			printf("Error: unknown race!");
		} break;
	} printf("\n");

	return 0;
}
