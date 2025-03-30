// g++ main.cpp -o main -std=c++11 -I/usr/include/python3.9 -lpython3.9 -DWITHOUT_NUMPY
// g++ main.cpp -o main -std=c++11 -lpython3.9 -I/usr/include/python3.9 -I/usr/lib/python3.9/site-packages/numpy/core/include

#include "matplotlibcpp.h"
namespace plt = matplotlibcpp;
int main() {
    plt::plot({1,3,2,4});
    plt::show();
}
