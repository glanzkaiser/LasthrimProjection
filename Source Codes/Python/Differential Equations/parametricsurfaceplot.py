from sympy import *
from spb import *

u, v = symbols("u, v")
r = 2 + sin(7 * u + 5 * v)
expr = (
    r * cos(u) * sin(v),
    r * sin(u) * sin(v),
    r * cos(v)
)
plot3d_parametric_surface(*expr, (u, 0, 2 * pi), (v, 0, pi), "expr",
    backend=MB, use_cm=True)