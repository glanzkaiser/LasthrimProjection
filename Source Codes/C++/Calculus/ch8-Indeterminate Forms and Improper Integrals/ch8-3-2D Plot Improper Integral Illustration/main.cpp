// Merci beaucoup Sentinel
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
	gp << "set xrange [0:6]\nset yrange [0:0.5]\n";
	// '-' means read from stdin.  The send1d() function sends data to gnuplot's stdin.
	gp << "f1(x) = x*exp(-x)\n";
	gp << "f2(x) = (x>=0 && x<= 1.1) ? x*exp(-x) : 1/0\n";
	gp << "set arrow 1 from 1,0 to 1,f1(1) nohead lw 1 lc 2\n";
	//gp << "set arrow 1 from 3,0 to 3,f1(3) nohead lw 1 lc 2\n";
	// '+' [0:1] using 1:($1*exp(-$1)) w filledcurves y2 title 'area'
	gp << "plot f1(x) title 'x exp(-x)' lw 2 lc 'black', f2(x) title 'area' with filledcurves y2=0\n";

	
	return 0;
}