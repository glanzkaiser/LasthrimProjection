# Compare the plot at xy axis with the solid of revolution toward x and y axis
# For region bounded by the line y = 6x and y = 6x^2
# Plotting the revolution of the bounded region 
# can be done by limiting the np.linspace of the y, u, and x_inverse values 
# You can determine the limits by finding the intersection points of the two functions.

import matplotlib.pyplot as plt
import numpy as np
import sympy as sy
  
def r1(x):
    return 6*x

def r2(x):
    return 6*(x**2)

def r3(x):
    return x/6

def r4(x):
    return (x/6)**(1/2)

def vx(x):
    return np.pi*(r1(x)**2 - r2(x)**2)

def vy(x):
    return np.pi*(r4(x)**2 - r3(x)**2)
  
x = sy.Symbol("x")
vx = sy.integrate(vx(x), (x, 0, 1))
vy = sy.integrate(vy(x), (x, 0, 6))

n = 200

fig = plt.figure(figsize=(14, 7))
ax1 = fig.add_subplot(221)
ax2 = fig.add_subplot(222, projection='3d')
ax3 = fig.add_subplot(223)
ax4 = fig.add_subplot(224, projection='3d')

y = np.linspace(0, 6, n)
x1 = (y / 6)
x2 = (y / 6) ** (1 / 2)
t = np.linspace(0, np.pi * 2, n)

u = np.linspace(0, 1, n)
v = np.linspace(0, 2 * np.pi, n)
U, V = np.meshgrid(u, v)

X = U
Y1 = (6 * U ** 2) * np.cos(V)
Z1 = (6 * U ** 2) * np.sin(V)

Y2 = (6 * U) * np.cos(V)
Z2 = (6 * U) * np.sin(V)

Y3 = ((1 / 6) * U ** (1 / 2)) * np.cos(V)
Z3 = ((1 / 6) * U ** (1 / 2)) * np.sin(V)

Y4 = (U / 6) * np.cos(V)
Z4 = (U / 6) * np.sin(V)

ax1.plot(x1, y, label='$y=6x$')
ax1.plot(x2, y, label='$y=6x^{2}$')
ax1.legend()

ax1.set_title('$f(x)$')
ax2.plot_surface(X, Y3, Z3, alpha=0.3, color='red', rstride=6, cstride=12)
ax2.plot_surface(X, Y4, Z4, alpha=0.3, color='blue', rstride=6, cstride=12)
ax2.set_title("$f(x)$: Revolution around $y$ \n Volume = {}".format(vy))

# find the inverse of the function
x_inverse = np.linspace(0, 6, n)
y1_inverse = np.power(x_inverse/6, 1)
y2_inverse = np.power(x_inverse/6, 1 / 2)

ax3.plot(x_inverse, y1_inverse, label='Inverse of $y=6x$')
ax3.plot(x_inverse, y2_inverse, label='Inverse of $y=6x^{2}$')
ax3.set_title('Inverse of $f(x)$')
ax3.legend()

ax4.plot_surface(X, Y1, Z1, alpha=0.3, color='red', rstride=6, cstride=12)
ax4.plot_surface(X, Y2, Z2, alpha=0.3, color='blue', rstride=6, cstride=12)
ax4.set_title("$f(x)$: Revolution around $x$ \n Volume = {}".format(vx))

plt.tight_layout()
plt.show()
