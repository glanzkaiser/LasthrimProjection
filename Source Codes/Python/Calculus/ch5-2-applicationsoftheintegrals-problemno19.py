# Compare the plot at xy axis with the solid of revolution toward x and y axis
# For region bounded by the line x - 2y = 0 and y^2 = 4x
# Plotting the revolution of the bounded region 
# can be done by limiting the np.linspace of the y, u, and x_inverse values 
# You can determine the limits by finding the intersection points of the two functions.

import matplotlib.pyplot as plt
import numpy as np
import sympy as sy
  
def r1(x):
    return x/2

def r2(x):
    return 2*(x**(1/2))

def r3(x):
    return 2*x

def r4(x):
    return (x/2)**(2)

def vx(x):
    return np.pi*(r2(x)**2 - r1(x)**2)

def vy(x):
    return np.pi*(r3(x)**2 - r4(x)**2)
  
x = sy.Symbol("x")
vx = sy.integrate(vx(x), (x, 0, 16))
vy = sy.integrate(vy(x), (x, 0, 8))

n = 200

fig = plt.figure(figsize=(14, 7))
ax1 = fig.add_subplot(221)
ax2 = fig.add_subplot(222, projection='3d')
ax3 = fig.add_subplot(223)
ax4 = fig.add_subplot(224, projection='3d')

y = np.linspace(0, 8, n)
x1 = (2*y)
x2 = (y / 2) ** (2)
t = np.linspace(0, np.pi * 2, n)

u = np.linspace(0, 16, n)
v = np.linspace(0, 2 * np.pi, n)
U, V = np.meshgrid(u, v)

X = U
Y1 = (2 * U ** (1/2)) * np.cos(V)
Z1 = (2 * U ** (1/2)) * np.sin(V)

Y2 = (U / 2) * np.cos(V)
Z2 = (U / 2) * np.sin(V)

Y3 = ((U / 2) ** (2)) * np.cos(V)
Z3 = ((U / 2) ** (2)) * np.sin(V)

Y4 = (2*U) * np.cos(V)
Z4 = (2*U) * np.sin(V)

ax1.plot(x1, y, label='$y=x/2$')
ax1.plot(x2, y, label='$y=2 \sqrt{x}$')
ax1.legend()

ax1.set_title('$f(x)$')
ax2.plot_surface(X, Y3, Z3, alpha=0.3, color='red', rstride=6, cstride=12)
ax2.plot_surface(X, Y4, Z4, alpha=0.3, color='blue', rstride=6, cstride=12)
ax2.set_title("$f(x)$: Revolution around $y$ \n Volume = {}".format(vy))

# find the inverse of the function
x_inverse = np.linspace(0, 8, n)
y1_inverse = np.power(2*x_inverse, 1)
y2_inverse = np.power(x_inverse / 2, 2)

ax3.plot(x_inverse, y1_inverse, label='Inverse of $y=x/2$')
ax3.plot(x_inverse, y2_inverse, label='Inverse of $y=2 \sqrt{x}$')
ax3.set_title('Inverse of $f(x)$')
ax3.legend()

ax4.plot_surface(X, Y1, Z1, alpha=0.3, color='red', rstride=6, cstride=12)
ax4.plot_surface(X, Y2, Z2, alpha=0.3, color='blue', rstride=6, cstride=12)
ax4.set_title("$f(x)$: Revolution around $x$ \n Volume = {}".format(vx))

plt.tight_layout()
plt.show()
