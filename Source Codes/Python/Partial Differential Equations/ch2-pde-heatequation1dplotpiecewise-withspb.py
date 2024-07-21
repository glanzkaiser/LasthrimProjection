# https://stackoverflow.com/questions/77259323/can-sympy-compute-definite-integral-by-cases/77259532#77259532
# https://stackoverflow.com/questions/77258199/how-to-replace-the-variable-from-sympy-computation-so-it-can-be-plotted-with-mat/77258592#77258592
# https://stackoverflow.com/questions/77262913/integral-with-piecewise-resulting-into-different-3d-wireframe-plot-using-sympy-a/77264145#77264145
import numpy as np
import sympy as sm
from sympy import *
from spb import *

x = sm.symbols("x")
t = sm.symbols("t")
n = sm.symbols("n", integer=True)

L = 20
D = 0.475
f = (S(2)/L)*sin(n*pi*x/20)*Piecewise((x, (0 <= x) & (x <= 10)), (20-x, (10 < x) & (x <= 20)))
print('The function u(x,0) : ')
print('')
sm.pretty_print(f)
print('')
print('')
print(piecewise_fold(f))

fint = integrate(f, (x, 0, 20))
g = fint*sin(n*pi*x/20)*exp(-(n**2)*(pi**2)*D*t/400).nsimplify()
print('')
print('')
sm.pretty_print(fint)
print('')
print('')

s3 = 0
for c in range(10):
    s3 += g.subs({n:c})

print('')
print('The function u(x,t) : ')
print('')
sm.pretty_print(s3)

plot3d(
    s3, (x, 0, 20), (t, 0, 10),  {"alpha": 0}, # hide the surface
    wireframe=True, wf_n1=20, wf_n2=10,
    wf_rendering_kw={"color": "tab:blue"}, # optional step to customize the wireframe lines
    backend=MB, zlabel="$u(x,t)$", title="One Dimensional Heat Equation"
)
