// g++ -o result main.cpp -lboost_iostreams 
// Merci beaucoup Freya et Sentinel..

#define DEGTORAD 0.0174532925199432957f
#define RADTODEG 57.295779513082320876f
	
#include "gnuplot-iostream.h"

using namespace std;

// Driver code
int main(int argc, char** argv)
{
	// Plotting time
	Gnuplot gp;

	// Don't forget to put "\n" at the end of each line!
	gp << "set parametric\n";
	//gp << "unset key\n";
	gp << "set zeroaxis lw 2\n";
	gp << "set xrange [-1.3:1.3]\nset yrange [-1.3:1.3]\n";
	gp << "set xlabel 'x-axis'\n set ylabel 'y-axis'\n";
	// '-' means read from stdin.  The send1d() function sends data to gnuplot's stdin.
	gp << "plot (cos(t))**(3),(sin(t))**(3) title '( cos^{3} t, sin^{3} t)' lt 3 lc rgb 'dark-turquoise'\n";
	
	return 0;
}