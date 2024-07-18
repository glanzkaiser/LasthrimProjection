# R is a region in the xy plane bounded by y = 4 - 2x (x = 2 - y/2) 
# Plot A solid of revolution that is formed by rotating R around the x axis. 
import numpy as np
import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d.axes3d as axes3d
from matplotlib import cm

np.seterr(divide='ignore', invalid='ignore')

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ll, ul = 0, 60
u = np.linspace(ll, ul, 100)
v = np.linspace(0, 2*np.pi, 60)
U, V = np.meshgrid(u, v)

Y = 2 - U/2 
X = U*np.cos(V)
Z = U*np.sin(V)

ax.set_xlabel('Y axis')
ax.set_ylabel('X axis')
ax.set_zlabel('Z axis')

ax.plot_surface(X, Y, Z, cmap=plt.cm.YlGnBu_r)

plt.show()