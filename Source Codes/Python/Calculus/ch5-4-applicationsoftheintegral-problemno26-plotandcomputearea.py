import matplotlib.pyplot as plt
import numpy as np
import sympy as sy

x = sy.Symbol("x")

def f(x):
    return ((x**6) + 2)/ (8*x ** 2)

def fd(x):
    return sy.simplify(sy.diff(f(x), x))

def f2(x):
    return sy.sqrt((1 + (fd(x)**2)))

def vx(x):
    return 2*sy.pi*(f(x)*sy.sqrt(1 + (fd(x) ** 2)))
  
vxi = sy.Integral(vx(x), (x, 1, 3))
vxf = vxi.simplify().doit()
vxn = vxf.evalf()

n = 100

fig = plt.figure(figsize=(14, 7))
ax1 = fig.add_subplot(221)
ax2 = fig.add_subplot(222, projection='3d')
ax3 = fig.add_subplot(223)
ax4 = fig.add_subplot(224, projection='3d')
x = np.linspace(1, 3, 3)
y = ((x ** 6) + 2) / (8 * x ** 2)
t = np.linspace(0, np.pi * 2, n)

xn = np.outer(x, np.cos(t))
yn = np.outer(x, np.sin(t))
zn = np.zeros_like(xn)
for i in range(len(x)):
    zn[i:i + 1, :] = np.full_like(zn[0, :], y[i])

ax1.plot(x, y)
ax1.set_title("$f(x)$")
ax2.plot_surface(xn, yn, zn)
ax2.set_title("$f(x)$: Revolution around $y$")

# find the inverse of the function
y_inverse = x
x_inverse = ((y_inverse ** 6) + 2) / ( 8 * x ** 2)
xn_inverse = np.outer(x_inverse, np.cos(t))
yn_inverse = np.outer(x_inverse, np.sin(t))
zn_inverse = np.zeros_like(xn_inverse)
for i in range(len(x_inverse)):
    zn_inverse[i:i + 1, :] = np.full_like(zn_inverse[0, :], y_inverse[i])

ax3.plot(x_inverse, y_inverse)
ax3.set_title("Inverse of $f(x)$")
ax4.plot_surface(xn_inverse, yn_inverse, zn_inverse)
ax4.set_title("$f(x)$: Revolution around $x$ \n Surface Area = {}".format(vxn))

plt.tight_layout()
plt.show()