# https://sympy-plot-backends.readthedocs.io/en/latest/overview.html#examples

from sympy import symbols, cos, sin, pi
from spb import plot3d_parametric_surface, MB
import numpy as np
u, v = symbols("u, v")
def trefoil(u, v, r):
    x = r * sin(3 * u) / (2 + cos(v))
    y = r * (sin(u) + 2 * sin(2 * u)) / (2 + cos(v + pi * 2 / 3))
    z = r / 2 * (cos(u) - 2 * cos(2 * u)) * (2 + cos(v)) * (2 + cos(v + pi * 2 / 3)) / 4
    return x, y, z
p1 = plot3d_parametric_surface(
   trefoil(u, v, 3), (u, -pi, 3*pi), (v, -pi, 3*pi), "radius",
   grid=False, title="Trefoil Knot", backend=MB, use_cm=True,
   color_func=lambda x, y, z: np.sqrt(x**2 + y**2 + z**2),
   wireframe=True, wf_n1=100, wf_n2=30, n1=250, show=False)
p1.show()