// g++ main.cpp -o result -lginac -lcln
#include <iostream>
#include <ginac/ginac.h>

using namespace std;
using namespace GiNaC;

int main()
{
	symbol x("x");
	symbol t("t");
	 
	ex fx, gx, Dxf, Dxg, Dx2f, Dx2g; // construct expressions 
	fx = integral(t,0,x,1+sin(t));
	gx = x;
	
	Dxf = diff(fx,x);
	Dxg = diff(gx,x);
	Dx2f = diff(Dxf,x);
	Dx2g = diff(Dxg,x);
	ex limit = (Dxf/Dxg).subs(x == 0);
	cout << "\nDerivative of " << fx << " is " << Dxf << endl;
	cout << "\nDerivative of " << gx << " is " << Dxg << endl;
	cout << "\nf(x) / g(x)  = " << fx/gx << endl;
	cout << "\nD_{x} f(x) / D_{x} g(x) = " << Dxf/Dxg << endl;
	cout << "\nlim_{x -> 0} D_{x}^{2} f(x) / D_{x}^{2} g(x) = " << limit << endl;
	return 0;
}