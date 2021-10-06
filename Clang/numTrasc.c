#define e 2.718281

int fac(int x){
	int r = 1;
	for(int i=1; i<=x; i++){
		r = r*i;
	}
	return r;
}

float Npow(float x, int n){
	float r = 1;
	for(int i=1; i<=n; i++){
		r = r*x;
	}
	return r;
}

float Nexp(float x){
	int n = 13;
	float r = 0.0;
	for(int i=0; i<n; i++){
		r += Npow(x,i)/fac(i);
	}
	return r;
}


float Nln(float x){
    int m = 0;
    while(Npow(e, m) <= x) m++;
    if((Npow(e, m)-x) > (x-Npow(e,m-1))) m-=1;
    float x0 = Npow(e, m);
    return m + (x-x0)/x;
}

float Nlog(float x, float a){
    int m = 0;
    while(Npow(a, m) <= x) m++;
    if((Npow(a, m)-x) > (x-Npow(a,m-1))) m-=1;
    float x0 = Npow(a, m);
    return m + (x-x0)/(x*Nln(a));
}