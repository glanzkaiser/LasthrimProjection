# import inverse_laplace_transform
from sympy.integrals.transforms import inverse_laplace_transform
from sympy import *
from sympy.abc import s, t

a = Symbol('a', positive = True)
# Using inverse_laplace_transform() method
#gfg = inverse_laplace_transform(exp(-a * s)/s, s, t)
#gfg = inverse_laplace_transform(exp(-a * s)/s, s, 5)
gfg = inverse_laplace_transform(1/(s**2 + a**2), s, 5)

print(gfg)