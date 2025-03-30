// Demo of vector plot.
// Compile it with:
//   g++ -o main main.cpp -lboost_iostreams 

#include <vector>
#include <cmath>
#include <utility>
#include <boost/tuple/tuple.hpp>

#include "gnuplot-iostream.h"

int main() {
	Gnuplot gp;

	// Don't forget to put "\n" at the end of each line!
	gp << "set xrange [0:1]\nset yrange [0:3]\n";
	// '-' means read from stdin.  The send1d() function sends data to gnuplot's stdin.
	gp << "f1(x) = (1**2)*x*exp(-1*x)\n";
	gp << "f2(x) = (2**2)*x*exp(-2*x)\n";
	gp << "f3(x) = (3**2)*x*exp(-3*x)\n";
	gp << "f4(x) = (4**2)*x*exp(-4*x)\n";
	gp << "f5(x) = (5**2)*x*exp(-5*x)\n";
	gp << "f6(x) = (6**2)*x*exp(-6*x)\n";
	gp << "plot f1(x) title 'n=1', f2(x) title 'n=2', f3(x) title 'n=3', f4(x) title 'n=4', f5(x) title 'n=5', f6(x) title 'n=6'\n";

	
	return 0;
}