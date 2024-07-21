# https://neutrinobh.medium.com/plotting-vector-fields-using-matplotlib-in-three-steps-with-examples-4ef30ddc68cd

#Plotting vector fields
import matplotlib.pyplot as plt
import numpy as np

x,y = np.meshgrid(np.linspace(-np.pi,np.pi,20),np.linspace(-np.pi,np.pi,20))

u = np.sin(x); v =np.cos(y)
M=np.hypot(u,v)

fig, ax = plt.subplots(figsize=(10,6))
q = ax.quiver(x, y, u, v, M, pivot='tail', width=0.004, scale_units='x', scale=2)
ax.scatter(x,y, c='red', s=2.7)

ax.set_title(r'Vector field $\vec{F} = \sin x  \vec{i}+\cos y  \vec{j}$')

fig.savefig('vectorfield.png')
plt.show()

# There is another way to change the color of arrows, 
# by adding quiver(x, y, u, v, M) where matrix M contains numerical values 
# that are going to define different arrow colors, 
# by colormapping via norm and camp.
# This is shown in the next example where elements of matrix M 
# are chosen as a square root of sum x²+y² (any other way to calculate M would be equally good).


# M is a color matrix, pivot=’tail’ gives the location of the arrow 
# in relation with a point which represents, 
# width gives the width of arrows, 
# scale_units=’x’ defines units to be the same as units of the x-axis, 
# and scale=2 defines the length of arrows 
# (Number of data units per arrow length unit, 
# e.g., m/s per plot width; a smaller scale parameter makes the arrow longer. 
