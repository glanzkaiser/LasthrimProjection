// g++ main.cpp -o main -std=c++11 -I/usr/include/python3.9 -lpython3.9 -DWITHOUT_NUMPY
// g++ main.cpp -o main -std=c++11 -lpython3.9 -I/usr/include/python3.9 -I/usr/lib/python3.9/site-packages/numpy/core/include

#include "matplotlibcpp.h"
namespace plt = matplotlibcpp;
int main()
{
	std::vector<std::vector<double>> x, y, z;
	for (double i = -5; i <= 5;  i += 0.25) 
	{
	std::vector<double> x_row, y_row, z_row;
	for (double j = -5; j <= 5; j += 0.25) 
	{
		x_row.push_back(i);
		y_row.push_back(j);
		z_row.push_back(::std::sin(::std::hypot(i, j)));
	}
	x.push_back(x_row);
	y.push_back(y_row);
	z.push_back(z_row);
	}

	plt::xlim(0, 100);
	plt::ylim(0, 100);
	plt::plot_surface(x, y, z);
	plt::show();
}