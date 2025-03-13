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
	fx = integral(t,0,x,sqrt(t)*cos(t));
	gx = pow(x,2);
	
	Dxf = diff(fx,x);
	Dxg = diff(gx,x);
	Dx2f = diff(Dxf,x);
	Dx2g = diff(Dxg,x);
	ex limit = (Dxf/Dxg).subs(x == 0.000001);
	cout << "\nDerivative of " << fx << " is " << Dxf << endl;
	cout << "\nDerivative of " << gx << " is " << Dxg << endl;
	cout << "\nf(x) / g(x)  = " << fx/gx << endl;
	cout << "\nD_{x} f(x) / D_{x} g(x) = " << Dxf/Dxg << endl;
	cout << "\nlim_{x -> 0^{+}} D_{x}^{2} f(x) / D_{x}^{2} g(x) = " << limit << endl;
	return 0;
}