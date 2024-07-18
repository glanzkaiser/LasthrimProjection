# https://stackoverflow.com/questions/59402531/how-to-produce-a-revolution-of-a-2d-plot-with-matplotlib-in-python
# R is a region in the xy plane bounded by y = sin (x/2), x=0, and x=2pi 
# x = 2 * arcsin(y)
# (y=0, to y=1) because arcsin(1) = pi and arcsin(0) = 0
# Create a solid of revolution that is formed by rotating R around the y axis. 
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np

n = 100

fig = plt.figure(figsize=(12,6))
ax1 = fig.add_subplot(121)
ax2 = fig.add_subplot(122,projection='3d')
x = np.linspace(0, 2*np.pi, n)
y = np.sin(x/2)
t = np.linspace(0, np.pi*4, n)

xn = np.outer(x, np.cos(t))
yn = np.outer(x, np.sin(t))
zn = np.zeros_like(xn)

for i in range(len(x)):
    zn[i:i+1,:] = np.full_like(zn[0,:], y[i])

ax1.plot(x, y, label='y = sin(x/2)')
ax1.legend(loc='upper left') 
ax2.plot_surface(xn, yn, zn)
plt.show()