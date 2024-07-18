https://pypi.org/project/pynverse/
from pynverse import inversefunc

# Pynverse provides a main function inversefunc 
# it calculates the numerical inverse of a function f 
# passed as the first argument in the form of a callable.

# calculate the inverse function at certain y_values points:

cube = (lambda x: x**3)
invcube = inversefunc(cube, y_values=27)

print('cube and its inverse ')
print('Method 1: with y_values=27 ')
print('27^(1/3) : ', invcube)

# calculate the inverse values at any other points if y_values is not provided:
invcube2 = inversefunc(cube)

print('Method 2: no y_values ')
print('27^(1/3) : ', invcube2(27))
