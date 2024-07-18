from pynverse import inversefunc
import numpy as np
# Pynverse provides a main function inversefunc 
# it calculates the numerical inverse of a function f 
# passed as the first argument in the form of a callable.

# calculate the inverse function at certain y_values points:
# By default, the domain includes all real numbers, 
# but it can be restricted to an inverval using the domain argument:
invsquare = inversefunc(np.power, args=(2), domain=0)

print('y = x^2')
print('x = [4, 16, 64]')
print('(x^2)^(-1) : ', invsquare([4, 16, 64]))
