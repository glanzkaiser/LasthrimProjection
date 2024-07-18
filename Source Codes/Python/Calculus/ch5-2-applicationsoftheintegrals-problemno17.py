# Compare the plot at xy axis with the solid of revolution toward x and y axis
# For ellipse y = b (1-x^2/a^2)^(1/2) 
# a = 10 and b = 6
import matplotlib.pyplot as plt
import numpy as np

n = 100
a = 10
b = 6

fig = plt.figure(figsize=(14, 7))
ax1 = fig.add_subplot(221)
ax2 = fig.add_subplot(222, projection='3d')
ax3 = fig.add_subplot(223)
ax4 = fig.add_subplot(224, projection='3d')
y = np.linspace(0, 30, n)
x = a*((1 - (y**2)/(b**2)) ** (1 / 2))
t = np.linspace(0, np.pi * 2, n)

xn = np.outer(x, np.cos(t))
yn = np.outer(x, np.sin(t))
zn = np.zeros_like(xn)
for i in range(len(x)):
    zn[i:i + 1, :] = np.full_like(zn[0, :], y[i])

# find the inverse of the function
x_inverse = y
y_inverse = np.power((a**2)*(1 - (x_inverse**2)/(b**2)), 1 / 2)
xn_inverse = np.outer(x_inverse, np.cos(t))
yn_inverse = np.outer(x_inverse, np.sin(t))
zn_inverse = np.zeros_like(xn_inverse)
for i in range(len(x_inverse)):
    zn_inverse[i:i + 1, :] = np.full_like(zn_inverse[0, :], y_inverse[i])

ax1.plot(x, y)
ax1.set_title("$f(x)$")
ax2.plot_surface(xn_inverse, yn_inverse, zn_inverse)
ax2.set_title("$f(x)$: Revolution around $x$")

plt.tight_layout()
plt.show()