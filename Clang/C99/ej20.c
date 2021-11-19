#include <stdio.h>
#include <stdlib.h>
#include "safe_io.h"

typedef struct vector vector;
struct vector {
	int length;
	int *values;
};

vector	obtener_vector();
float	promedio(vector);
void	clasifica(vector, float);

int main(void) {
	vector vec;
	float prom = 0.0;
	vec = obtener_vector();
	prom = promedio(vec);
	clasifica(vec, prom);
	free(vec.values);
	return 0;
}

vector obtener_vector() {
	vector vec;
	char msg[50];
	vec.length = readInt("Tamaño del vector: ");
	vec.values = malloc(vec.length*sizeof(int));
	for (int i=0; i < vec.length; i++) {
		sprintf(msg, "Valor [%d]: ", i);
		vec.values[i] = readInt(msg);
	}
	return vec;
}

float promedio(vector vec) {
	float ans = 0.0;
	for (int i=0; i < vec.length; i++) {
		ans += vec.values[i];
	}
	ans /= vec.length;
	return ans;
}

void clasifica(vector vec, float value) {
	int num = 0;
	char msg[60], parity[10], comp[10];
	printf("\n");
	for(int i=0; i < vec.length; i++) {
		num = vec.values[i];
		if		((num & 1) == 0)sprintf(parity, "par");
		else					sprintf(parity, "non");
		if		(num > value)	sprintf(comp,	"mayor");
		else if (num < value)	sprintf(comp,	"menor");
		else					sprintf(comp,	"igual");
		
		sprintf(msg, "%d es %s y %s que %.2f\n", num, parity, comp, value);
		fputs(msg, stdout);
	}
}
