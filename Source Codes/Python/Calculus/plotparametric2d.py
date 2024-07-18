# https://sympy-plot-backends.readthedocs.io/en/latest/overview.html#examples

import numpy as np
from spb import plot_parametric
p = plot_parametric(
   lambda t: np.sin(3 * t + np.pi / 4), lambda t: np.sin(4 * t),
   ("t", 0, 2 * np.pi), "t [rad]", xlabel="x", ylabel="y", aspect="equal")

p.show()