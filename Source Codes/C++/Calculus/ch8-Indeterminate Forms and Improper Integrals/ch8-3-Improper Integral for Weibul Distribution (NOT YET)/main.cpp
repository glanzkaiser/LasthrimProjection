// g++ main.cpp -o result -lsymbolicc++
#include <iostream>
#include "symbolicc++.h"

using namespace std;

int main()
{
	Symbolic x("x"), θ("θ"), µ("µ"), β("β"), fx, fx_int, Efx_int, Varfx_int;
	fx = (β/θ)*pow((x/θ),β-1)*exp((x/θ)^β);
	
	cout << "f(x) = " << fx <<  endl;
	
	fx_int = integrate(fx,x);
	
	cout << "\n********************************** "  << endl;
	cout << "\nFor integral from - infinity to infinity we will have"  << endl;
	cout << "\n********************************** "  << endl;
	cout << " int_{- infty}^{infty} λ exp(-λx) = " << fx_int[x==9999] - fx_int[x==0] << endl;

	return 0;
}