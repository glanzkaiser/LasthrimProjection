// g++ main.cpp -o result -lginac -lcln
#include <iostream>
#include <ginac/ginac.h>

using namespace std;
using namespace GiNaC;

int main()
{
	symbol x("x");
	symbol t("t");
	 
	ex fx; // construct expressions 
	fx = x*exp(-x);
	
	for (int i = 1; i <= 3; ++i)
	{
		cout << " \int_{0}^{" << i << "} x exp(-x) = " << integral(x,0,i,fx).evalf() << endl;
	}

	cout << "\n********************************** "  << endl;
	cout << "\nFor integral from 0 to infinity we will have"  << endl;
	cout << "\n********************************** "  << endl;
	cout << " \int_{0}^{infty} x exp(-x) = " << integral(x,0,99,fx).evalf() << endl;
	return 0;
}