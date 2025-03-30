// g++ main.cpp -o result -lsymbolicc++
#include <iostream>
#include "symbolicc++.h"

using namespace std;

int main()
{
	Symbolic x("x"), λ("λ"), µ("µ"), fx, fx_int, Efx_int, Varfx_int;
	fx = λ*exp(-λ*x);
	
	cout << "f(x) = " << fx <<  endl;
	
	fx_int = integrate(fx,x);
	Efx_int = integrate(x*fx,x);
	Varfx_int = integrate(2*x*exp(-λ*x),x);
	µ = 1/λ;

	cout << "\n********************************** "  << endl;
	cout << "\nFor integral from - infinity to infinity we will have"  << endl;
	cout << "\n********************************** "  << endl;
	cout << " \int_{- infty}^{infty} λ exp(-λx) = " << fx_int[x==9999, λ==1] - fx_int[x==0] << endl;

	cout << "\n********************************** "  << endl;
	cout << "\nFor the E(X)"  << endl;
	cout << "\n********************************** "  << endl;
	cout << " E(X) = " << Efx_int[x==9999, λ==1] - Efx_int[x==0] << endl;

	cout << "\n********************************** "  << endl;
	cout << "\nFor the Var(X)"  << endl;
	cout << "\n********************************** "  << endl;
	cout << " Var(X) = " << Varfx_int[x==9999, λ==1] - Varfx_int[x==0] - (µ*µ) << endl;
	
	cout << "\n********************************** "  << endl;
	cout << "\nFor the cdf"  << endl;
	cout << "\n********************************** "  << endl;
	cout << " F(X) = " << fx_int - fx_int[x==0]  << endl;
	
	cout << "\n********************************** "  << endl;
	cout << "\nThe probability that the lifetime is 20 hours or greater"  << endl;
	cout << "\n********************************** "  << endl;
	cout << " P(X>20) = " << fx_int[x==9999] - fx_int[x==20,  λ==0.01]  << endl;
	
	return 0;
}