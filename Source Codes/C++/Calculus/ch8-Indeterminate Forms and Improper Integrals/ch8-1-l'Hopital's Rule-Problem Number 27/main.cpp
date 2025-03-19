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
	fx = 0.5*sin(x)*(1-cos(x));
	gx = 0.5*(x-cos(x)*sin(x));
	
	Dxf = diff(fx,x);
	Dxg = diff(gx,x);
	Dx2f = diff(Dxf,x);
	Dx2g = diff(Dxg,x);
	ex limit = (Dx2f/Dx2g).subs(x == 0.000001);
	cout << "\n********************************** "  << endl;
	cout << "\nPart(a) "  << endl;
	cout << "\n********************************** "  << endl;
	cout << "\nDerivative of " << fx << " is " << Dxf << endl;
	cout << "\nDerivative of " << gx << " is " << Dxg << endl;
	cout << "\nf(x) / g(x)  = " << fx/gx << endl;
	cout << "\nD_{x} f(x) / D_{x} g(x) = " << Dxf/Dxg << endl;
	cout << "\nlim_{x -> 0^{+}} D_{x}^{2} f(x) / D_{x}^{2} g(x) = " << limit << endl;
	
	cout << "\n********************************** "  << endl;
	cout << "\nPart(b) "  << endl;
	cout << "\n********************************** "  << endl;
	
	ex fbx, gbx, Dxfb, Dxgb, Dx2fb, Dx2gb, Dx3fb, Dx3gb; // construct expressions 
	fbx = 0.5*cos(x)*(sin(x)-x*cos(x));
	gbx = 0.5*(x-cos(x)*sin(x));
	Dxfb = diff(fbx,x);
	Dxgb = diff(gbx,x);
	Dx2fb = diff(Dxfb,x);
	Dx2gb = diff(Dxgb,x);
	Dx3fb = diff(Dx2fb,x);
	Dx3gb = diff(Dx2gb,x);
	ex limitb = (Dx3fb/Dx3gb).subs(x == 0.000001);
	
	cout << "\nDerivative of " << fbx << " is " << Dxfb << endl;
	cout << "\nDerivative of " << gbx << " is " << Dxgb << endl;
	cout << "\nf(x) / g(x)  = " << fbx/gbx << endl;
	cout << "\nD_{x} f(x) / D_{x} g(x) = " << Dxfb/Dxgb << endl;
	cout << "\nlim_{x -> 0^{+}} D_{x}^{3} f(x) / D_{x}^{3} g(x) = " << limitb << endl;
	
	return 0;
}