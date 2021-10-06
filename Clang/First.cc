#include <iostream>
#include <fstream>
#include <stdlib.h>
using namespace std;

int main(){
	ifstream flujo_in;
	ofstream flujo_out;
	flujo_in.open("in.dat");
	if(flujo_in.fail() || flujo_out.fail()){
		cout << "Error al abrir archivo";
		exit(1);
	}
	flujo_out.open("out.dat");

	int pri, seg, ter, cua;
	flujo_in >> pri >> seg >> ter;
	flujo_out<< "La suma de los primeros\n"
			 << "tres numeros de\n"
			 << "in.dat es " << (pri+seg+ter+cua);
	flujo_in.close();
	flujo_out.close();
	return 0;
}