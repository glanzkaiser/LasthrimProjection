# https://stackoverflow.com/questions/77258199/how-to-replace-the-variable-from-sympy-computation-so-it-can-be-plotted-with-mat/77258592#77258592
import numpy as np
import sympy as sm
from sympy import *
from spb import *

x = sm.symbols("x")
t = sm.symbols("t")
n = sm.symbols("n", integer=True)

L = 20
f1 = (2/L)*x*sin(n*np.pi*x/20)
f2 = (2/L)*(20-x)*sin(n*np.pi*x/20)
fint1 = sm.integrate(f1,(x,0,10))
fint2 = sm.integrate(f2,(x,10,20))

D = 0.475
g = (fint1+fint2)*sin(n*np.pi*x/20)*exp(-(n**2)*(np.pi**2)*D*t/400).nsimplify()
s = 0
for c in range(10):
    s += g.subs({n:c})
    print(s)

print('')
print('The function u(x,t) : ')
print('')
sm.pretty_print(s)
print('')
print('')

plot3d(
    s, (x, 0, 20), (t, 0, 10), {"alpha": 0}, # hide the surface
    wireframe=True, wf_n1=20, wf_n2=10,
    wf_rendering_kw={"color": "tab:blue"}, # optional step to customize the wireframe lines
    backend=MB, zlabel="$u(x,t)$", title="One Dimensional Heat Equation"
)
