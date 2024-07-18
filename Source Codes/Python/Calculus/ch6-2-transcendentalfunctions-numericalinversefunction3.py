from pynverse import inversefunc
import numpy as np
# Pynverse provides a main function inversefunc 
# it calculates the numerical inverse of a function f 
# passed as the first argument in the form of a callable.

# calculate the inverse function at certain y_values points:
# By default, the domain includes all real numbers, 
# but it can be restricted to an inverval using the domain argument:
result = inversefunc(np.log10, y_values=-2, # Should give 0.01
		domain=0, open_domain=[True, False])

print('y =log10(x))')
print('with y_values=-2')
print('log10(x)^(-1) : ', result)
