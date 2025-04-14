// g++ main.cpp -o main -std=c++11 -I/usr/include/python3.9 -lpython3.9 -DWITHOUT_NUMPY
// g++ main.cpp -o main -std=c++11 -lpython3.9 -I/usr/include/python3.9 -I/usr/lib/python3.9/site-packages/numpy/core/include

#include "matplotlibcpp.h"
#include <cmath>

double division(double x, double y)
{
	return x/y;
}
namespace plt = matplotlibcpp;
int main()
{
	// Prepare data.
	int n = 1000;
	std::vector<double> x(n), y(n), z(n);
	for(int i=0; i<n; ++i) 
	{
		x.at(i) = i;
		y.at(i) = pow(i-1,-division(2,3));
	}

	// Set the size of output image to 1200x780 pixels
	plt::figure_size(1200, 780);
	// Plot line from given x and y data. Color is selected automatically.
	plt::plot(x, y);
	// Plot a line whose name will show up as "x exp(-x)" in the legend.
	plt::named_plot("1/(x-1)^(2/3)", x, y);
	// Set x-axis to interval [0,10]
	plt::xlim(0, 10);
	// Add graph title
	plt::title("1/(x-1)^(2/3)");
	// Enable legend.
	plt::legend();
	plt::show();
	// Save the image (file format is determined by the extension)
	// plt::save("./basic.png");
}