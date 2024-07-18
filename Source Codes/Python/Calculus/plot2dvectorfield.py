# https://sympy-plot-backends.readthedocs.io/en/latest/overview.html#examples

from sympy import *
from spb import *
x, y = symbols("x, y")
expr = Tuple(1, sin(x**2 + y**2))
l = 2
p = plot_vector(
   expr, (x, -l, l), (y, -l, l),
   backend=MB, streamlines=True, scalar=False,
   xlim=(-l, l), ylim=(-l, l),
   title=r"$\vec{F} = " + latex(expr) + "$")

p.show()