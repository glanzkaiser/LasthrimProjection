from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection, Line3DCollection
import numpy as np

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# vertices of a prism
v = np.array([[-5, -2, -1.5], [5, -2, -1.5], [5, 2, -1.5],  [-5, 2, -1.5], [5,-2,1.5], 
		[-5,-2,1.5]])
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

hyp = (((b[1])** 2) + (c[2]**2) ) **(1/2) # hypotenuse of the triangle
r1 = (hyp)*a[0] # rectangle 1 area: with hypotenuse
r2 = b[1]*a[0] # rectangle 2 area: the base
r3 = c[2]*a[0] # rectangle 3 area: vertical one

s1 = (b[1]*c[2])/2 # triangle area
d = np.sqrt(c[2]**2 - a[0]**2)

volume=np.dot(a,np.cross(b,c)/2)
surface_area=2* (abs(s1)) + (abs(r1 + r2 + r3))

# Annotation
ax.set_title("Right-Angle Prism")
ax.text(4.7,0,4.5,"Volume= {}".format(volume), size=10,
                           verticalalignment='center', rotation=270)
ax.text(4.7,0,4.2,"Surface Area = {}".format(surface_area), size=10,
                           verticalalignment='center', rotation=270)
plt.show()