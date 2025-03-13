// g++ main.cpp -o result -lginac -lcln
#include <iostream>
#include <ginac/ginac.h>

using namespace std;
using namespace GiNaC;

int main()
{
	symbol x("x");
	ex fx, gx, Dxf, Dxg, Dx2f, Dx2g; // construct expressions 
	fx = cosh(x) - 1;
	gx = pow(x,2);
	
	Dxf = diff(fx,x);
	Dxg = diff(gx,x);
	Dx2f = diff(Dxf,x);
	Dx2g = diff(Dxg,x);
	ex limit = (Dx2f/Dx2g).subs(x == 0);
	cout << "\nDerivative of " << fx << " is " << Dxf << endl;
	cout << "\nDerivative of " << gx << " is " << Dxg << endl;
	cout << "\nf(x) / g(x)  = " << fx/gx << endl;
	cout << "\nD_{x} f(x) / D_{x} g(x) = " << Dxf/Dxg << endl;
	cout << "\nD_{x}^{2} f(x) / D_{x}^{2} g(x) = " << Dx2f/Dx2g << endl;
	cout << "\nlim_{x -> 0} D_{x}^{2} f(x) / D_{x}^{2} g(x) = " << limit << endl;
	return 0;
}