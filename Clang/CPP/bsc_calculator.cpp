#include <cstdio>
#include <cstddef>

enum class Operation {
	Add, Sub, Mul, Div
};

struct Calculator {
	Calculator(Operation c) {
		calculation = c;
	}
	int calculate(int a, int b) {
		switch (calculation) {
			case Operation::Add : {
				return a + b;
			} break;
			case Operation::Sub : {
				return a - b;
			} break;
			case Operation::Mul : {
				return a * b;
			}
			case Operation::Div : {
				return a / b;
			}
			default : {
				printf("Error: unknown calculation");
				return 0;
			} break;
		}
	}
	private:
	Operation calculation;
};

int main(void) {
	Calculator my_calc{ Operation::Div };
	printf("The result is: %d\n", my_calc.calculate(16, 4));
	return 0;
}
