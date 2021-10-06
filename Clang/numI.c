#include <stdio.h>
#include <math.h>
#define accuracy 0.0001
float f(float);

float f(float x){
	return sin(x);
}

int main(void){
	float a, b, delta_x, x_i, s=0;
	int n;
	printf("Set a: ");
	scanf("%f", &a);
	printf("Set b: ");
	scanf("%f", &b);

	n = (int)((b-a)/accuracy);
	delta_x = (b-a)/n;
	for(int i=1; i<=n; i++){
		x_i = a + (i-0.5)*delta_x;
		s += f(x_i)*delta_x;
	}

	printf("I[f(x)] with\na = %f\nb = %f\n", a, b);
	printf("is equal to: %f\n", s);
}