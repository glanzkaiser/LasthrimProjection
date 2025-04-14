
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
	gp << "set xrange [-2:4]\nset yrange [0:5]\n";
	// '-' means read from stdin.  The send1d() function sends data to gnuplot's stdin.
	gp << "f(x) = 1/(x-1)**(0.666667)\n";
	
	gp << "plot f(x) title 'f(x) = 1/(x-1)^{2/3}'\n";

	
	return 0;
}