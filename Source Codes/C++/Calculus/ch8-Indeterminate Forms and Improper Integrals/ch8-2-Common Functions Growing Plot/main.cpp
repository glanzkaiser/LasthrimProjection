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
	gp << "set xrange [0:50]\nset yrange [0:50]\n";
	// '-' means read from stdin.  The send1d() function sends data to gnuplot's stdin.
	gp << "f1(x) = log(x)\n";
	gp << "f2(x) = x**2\n";
	gp << "f3(x) = x*log(x)\n";
	gp << "f4(x) = exp(x)\n";
	gp << "f5(x) = sqrt(x)\n";
	gp << "plot f1(x) title 'ln(x)', f2(x) title 'x^{2}', f3(x) title 'x ln(x)', f4(x) title 'exp(x)', f5(x) title 'x^{0.5}'\n";

	
	return 0;
}