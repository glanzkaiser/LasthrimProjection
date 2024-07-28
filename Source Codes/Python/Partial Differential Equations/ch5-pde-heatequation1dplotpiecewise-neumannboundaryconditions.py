# https://stackoverflow.com/questions/77259323/can-sympy-compute-definite-integral-by-cases/77259532#77259532
# https://stackoverflow.com/questions/77258199/how-to-replace-the-variable-from-sympy-computation-so-it-can-be-plotted-with-mat/77258592#77258592
# https://stackoverflow.com/questions/77262913/integral-with-piecewise-resulting-into-different-3d-wireframe-plot-using-sympy-a/77264145#77264145
import numpy as np
import sympy as sm
from sympy import *
from spb import *

# Heat flows with Neumann boundary conditions
# d u(0,t) / dx = 0
# d u(100,t) / dx = 0
# with Initial Conditions:
# u(x,0) = x , 0<= x < = 40
# u(x,0) = 100-x , 40<= x < = 100
# Let u(x,t) = X(x) T(t)

x = sm.symbols("x")
t = sm.symbols("t")
n = sm.symbols("n", integer=True)

L = 100
D = 0.475
b0 = (1/L)*Piecewise((x, (0 <= x) & (x <= 40)), (100-x, (40 <= x) & (x <= 100)))

f = (S(2)/L)*cos(n*pi*x/L)*Piecewise((x, (0 <= x) & (x <= 40)), (100-x, (40 <= x) & (x <= 100)))
print('The function u(x,0) : ')
print('')
sm.pretty_print(f)
print('')
print('')
print(piecewise_fold(f))

b0_int = integrate(b0, (x, 0, 100))
B0 = b0_int

fint = integrate(f, (x, 0, 100))
g = fint*cos(n*pi*x/L)*exp(-(n**2)*(pi**2)*D*t/(L**2)).nsimplify()

# Manual way use this:
f1 = (2/L)*x*cos(n*pi*x/L)
f2 = (2/L)*(100-x)*cos(n*pi*x/L)
fint1 = sm.integrate(f1,(x,0,40))
fint2 = sm.integrate(f2,(x,40,100))

g2 = (fint1+fint2)*cos(n*pi*x/L)*exp(-(n**2)*(pi**2)*D*t/(L**2)).nsimplify()

print('')
print('')
sm.pretty_print(fint)
print('')
print('')

s3 = 0
for c in range(10):
    s3 += g.subs({n:c}) # change g to g2 for manual way computation, same end result

print('')
print('The function B0 : ')
print('')
sm.pretty_print(B0)

print('')
print('The function u(x,t) : ')
print('')
s4 = B0 + s3
sm.pretty_print(s4)

plot3d(
    s4, (x, 0, 100), (t, 0, 10),  {"alpha": 0}, # hide the surface
    wireframe=True, wf_n1=20, wf_n2=10,
    wf_rendering_kw={"color": "tab:blue"}, # optional step to customize the wireframe lines
    backend=MB, zlabel="$u(x,t)$", title="One Dimensional Heat Equation"
)
