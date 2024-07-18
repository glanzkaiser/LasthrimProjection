# Create triangular prism

using PyCall

ENV["PYTHON"] = "/home/browni/.julia/conda/3/bin/python3"
# the path is from the command 'which python3'

py"""

from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection, Line3DCollection
import numpy as np

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# vertices of a prism
v = np.array([[-5, -2, -2.5], [5, -2, -2.5], [5, 2, -2.5],  [-5, 2, -2.5], [5,0,2.5], 
		[-5,0,2.5]])
ax.scatter3D(v[:, 0], v[:, 1], v[:, 2])

# generate list of sides' polygons of our prism
verts = [ [v[0],v[1],v[4],v[5]], [v[0],v[3],v[5]],
 [v[2],v[1],v[4]], [v[2],v[3],v[5],v[4]], [v[0],v[1],v[2],v[3]]]

# plot sides
ax.add_collection3d(Poly3DCollection(verts, 
 facecolors='cyan', linewidths=1, edgecolors='r', alpha=.25))

# Calculate Volume and Surface Area
a=v[1]-v[0]
b=v[3]-v[0]
c=v[4]-v[1]

hyp = (((b[1]/2)** 2) + (c[2]**2) ) **(1/2) # hypotenuse of the triangle
s1 = (hyp)*a[0] # rectangle area
s2 = (b[1]*c[2])/2 # triangle area

volume=np.dot(a,np.cross(b,c)/2)
surface_area=2* (abs(s2)) + 3* (abs(s1))

# Annotation
ax.set_title("Prism")
ax.text(2,0,6.6,"Volume= {}".format(volume), size=10,
                           verticalalignment='center', rotation=270)
ax.text(2,0,7.2,"Surface Area = {}".format(surface_area), size=10,
                           verticalalignment='center', rotation=270)
plt.show()

"""