from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt
x = np.outer(np.linspace(0, 2*np.pi, 30), np.ones(30))
y = np.outer(np.linspace(0, 1*np.pi, 30), np.ones(30)).T # transpose
α = 0.5
z = np.sin(x) * np.exp(α * -y)

fig = plt.figure()

ax = plt.axes(projection='3d')

ax.plot_surface(x, y, z,cmap='viridis', edgecolor='none')
ax.set_title('Heat Equation Plot $U(x,t)= \sin(x) e^{-αt}$ for $α = 0.5$')
ax.set_xlabel('$x$')
ax.set_ylabel('$t$')
ax.set_zlabel('$U(x,t)$')
plt.show()