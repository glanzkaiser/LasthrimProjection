# Calculate the surface area of y = (x**6 + 2) / (8*x ** 2)
# revolved about the x-axis
# This method of computing the integral numerically is slow but accurate. 
# In particular it should be possible to trust that it is accurate 
# to the number of digits that are shown in the output:
# A.evalf(50)

# First declare x to be positive and secondly apply a simplification 
# inside the square root with sqf (square free factorisation):
using PyCall

ENV["PYTHON"] = "/home/browni/.julia/conda/3/x86_64/bin/python3"
# the path is from the command 'which python3'

py"""
from sympy import *

x = symbols('x')
f = (x**6 + 2) / (8*x ** 2)
A = 2*pi*Integral(f*sqrt(1 + f.diff(x)**2), (x, 1, 3))
# A.evalf(50)

x = symbols('x', positive=True)
f = ((x**6) + 2)/ (8*x ** 2)
A = 2*pi*Integral(f*sqrt(sqf(1 + f.diff(x)**2)), (x, 1, 3))
print('Area =', A.doit())
print('=',A.evalf())

"""