// g++ main.cpp -o main -std=c++11 -I/usr/include/python3.9 -lpython3.9 -DWITHOUT_NUMPY
// g++ main.cpp -o main -std=c++11 -lpython3.9 -I/usr/include/python3.9 -I/usr/lib/python3.9/site-packages/numpy/core/include

#include "matplotlibcpp.h"
namespace plt = matplotlibcpp;
int main()
{
	// u and v are respectively the x and y components of the arrows we're plotting
	std::vector<int> x, y, u, v;
	for (int i = -5; i <= 5; i++) 
	{
	for (int j = -5; j <= 5; j++) 
	{
		x.push_back(i);
		u.push_back(-i);
		y.push_back(j);
		v.push_back(-j);
	}
	}

	plt::quiver(x, y, u, v);
	plt::show();
}