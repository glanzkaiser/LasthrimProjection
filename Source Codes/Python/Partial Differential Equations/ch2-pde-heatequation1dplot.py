import numpy as np
import sympy as sm
from sympy import *

x = sm.symbols("x")
t = sm.symbols("t")
n = sm.symbols("n", integer=True)

L = 20
D = 0.475
f1 = (2/L)*x*sin(n*np.pi*x/20)
f2 = (2/L)*(20-x)*sin(n*np.pi*x/20)
fint1 = sm.integrate(f1,(x,0,10))
fint2 = sm.integrate(f2,(x,10,20))

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

from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt

n=30j
xx, tt = np.mgrid[0:20:n, 0:10:n]
f = sm.lambdify((x, t), s)

# For 3D Plotting
fig = plt.figure()
ax = fig.add_subplot(projection="3d")
ax.plot_wireframe(xx, tt, f(xx, tt))
ax.set_xlabel("x")
ax.set_ylabel("t")
ax.set_zlabel("$u(x,t)$")
ax.set_title("One Dimensional Heat Equation")

plt.show()
