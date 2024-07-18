# https://sympy-plot-backends.readthedocs.io/en/latest/overview.html#examples

from sympy import symbols, sin, cos, pi, latex
from spb import plot_polar
x = symbols("x")
expr = sin(2 * x) * cos(5 * x) + pi / 2
p = plot_polar(expr, (x, 0, 2 * pi),
    polar_axis=True, ylim=(0, 3), title="$%s$" % latex(expr))

p.show()