//gcc -o main main.c Librarys/numTrasc.c -l m
//Danyiel Sánchez 19-Nov-2020

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "Librarys/numTrasc.h"

void menu(void);

int main(void){
	int user = 1;
	while(user == 1){
		system("clear");
		menu();
		//Code go here
		printf("\nRepeat program?(1/0): ");
		scanf("%d", &user);
	}
	system("clear");
	return 0;
}

void menu(void){
	int n;
	float x, a, r1, r2;
	printf("1- pow(x, a)\n");
	printf("2- exp(a)\n");
	printf("3- ln(x)\n");
	printf("4- log(x, a)\n");
	printf("Choose one: ");
	scanf("%d", &n); printf("\n");
	switch(n){
		case 1:{
			printf("Set x: "); scanf("%f", &x);
			printf("Set a: "); scanf("%d", &a);
			r1 = pow(x, a); r2 = Npow(x, a);
			printf("R1: %f\nR2: %f\n", r1, r2);
			break;
		}
		case 2:{
			printf("Set x: "); scanf("%f", &x);
			r1 = exp(x); r2 = Nexp(x);
			printf("R1: %f\nR2: %f\n", r1, r2);
			break;
		}
		case 3:{
			printf("Set x: "); scanf("%f", &x);
			r1 = log(x); r2 = Nln(x);
			printf("R1: %f\nR2: %f\n", r1, r2);
			break;
		}
		case 4:{
			printf("Set x: "); scanf("%f", &x);
			printf("Set a: "); scanf("%f", &a);
			r1 = log(x)/log(a); r2 = Nlog(x, a);
			printf("R1: %f\nR2: %f\n", r1, r2);
			break;
		}
		default: break;
	}
}