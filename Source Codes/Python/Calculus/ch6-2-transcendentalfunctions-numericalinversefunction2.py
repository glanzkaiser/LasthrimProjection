from pynverse import inversefunc
import numpy as np
# Pynverse provides a main function inversefunc 
# it calculates the numerical inverse of a function f 
# passed as the first argument in the form of a callable.

# calculate the inverse function at certain y_values points:
# By default, the domain includes all real numbers, 
# but it can be restricted to an inverval using the domain argument:
result = inversefunc(np.cos, y_values=[1, 0, -1], # Should give [0, pi / 2, pi]
		domain=[0, np.pi])

print('y = cos(x)')
print('with y_values=[1, 0, -1]')
print('cos(x)^(-1) : ', result)
