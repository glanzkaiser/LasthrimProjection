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
	gp << "set xrange [-0.01:0.01]\nset yrange [-0.01:0.01]\n";
	// '-' means read from stdin.  The send1d() function sends data to gnuplot's stdin.
	gp << "f(x) = sin(x/2)\n";
	gp << "g(x) = x\n";
	gp << "plot f(x) title 'f(x) = sin (x/2)', g(x) title 'g(x)=x'\n";

	
	return 0;
}