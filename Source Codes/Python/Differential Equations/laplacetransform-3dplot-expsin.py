import sympy
sympy.init_printing()

import matplotlib.pyplot as plt
t, s = sympy.symbols('t, s')
a = sympy.symbols('a', real=True, positive=True)

def L(f):
    return sympy.laplace_transform(f, t, s, noconds=True)

def invL(F):
    return sympy.inverse_laplace_transform(F, s, t)

f1 = sympy.exp(-t)*sympy.sin(t)

F1 = sympy.integrate(f1*sympy.exp(-s*t), (t, 0, sympy.oo))
print('The Laplace Transform of')
sympy.pretty_print(f1)
print('is:')
sympy.pretty_print(F1)
print('or:')
F = sympy.laplace_transform(f1, t, s, noconds=True)
sympy.pretty_print(F)

print('Plot of f(t)')
sympy.plot(f1);

from sympy import *
from spb import * # pip install sympy_plot_backends
init_printing()

var("t, omega, s, alpha")
expr = exp(-t) * sin(t)
res = laplace_transform(expr, t, s, noconds=True)
print(res)

colorscale = [
    [0, "green"],
    [0.01, "orange"],
    [0.05, "red"],
    [1, "red"]
]
print('The Laplace Transform plot in 3-D:')
plot3d(abs(res.subs(s, alpha + I * omega)), (alpha, -2, 2), (omega, -2, 2), 
	use_cm=True, colorbar=False, backend=MB)
print('The contour plot:')
plot_contour(
    log(abs(res.subs(s, alpha + I * omega))), (alpha, -2, 2), (omega, -2, 2),
    "log(abs)", {"levels": 20},
    grid=False, n=300)

print('The complex plot (with domain coloring):')
#The module also exposes the plot_complex function, 
# which creates domain coloring plots. 
# In practice, it shows the absolute value of a complex function colored 
# by its argument. 3D domain coloring plots are also known as analytic landscapes:

plot_complex(
    res, (s, -2-2j, 2+2j), threed=True, real=False, imag=False, abs=True,
    backend=MB)