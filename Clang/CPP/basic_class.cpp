#include <cstdio>

class Clock {
	int year;

	public:
	Clock(int year) {
		if (!set_year(year)) {
			this->year = 2021;
		}
	}
	void add_year() {
		year++;
	}
	bool set_year(int new_year) {
		if (new_year < 2021) return false;
		year = new_year;
		return true;
	}
	bool is_leapYear(const Clock& clock) {
		if (clock.get_year() % 4 > 0)	return false;
		if (clock.get_year() % 100 > 0) return true;
		if (clock.get_year() % 400 > 0) return false;
		return true;
	}
	int get_year() const {
		return year;
	}
};

struct PodStruct {
	int		a;
	bool	b;
};

struct SmartArray {
	SmartArray() {
		printf("(no args)\n");
	}
	SmartArray(char x) {
		cell_size = sizeof(char);
		printf("char: %d\n", x);
	}
	size_t cell_size;
};

int main(void) {
	Clock clock { 2020 };
	Clock *clock_ptr = &clock;
	printf("Year: %d\n", (*clock_ptr).get_year());
	printf("Year: %d\n", clock_ptr->get_year());
	
	// braced initialization of POD
	PodStruct pod{ 42, false };
	printf("%d\n", pod.a);
	
	// braced initialization of array
	int array_1[5]{ 1, 2, 3 };
	for (int val : array_1) {
		printf("%d\n", val);
	}
	
	SmartArray arr{ 3 };
	// SmartArray arr(); The most vexing parse
	return 0;
}
