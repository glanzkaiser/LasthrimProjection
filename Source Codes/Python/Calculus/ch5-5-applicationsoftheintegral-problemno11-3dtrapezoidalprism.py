from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection, Line3DCollection
import numpy as np

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# vertices of a trapezoidal prism
v = np.array([[-5, -1.5, -2], [5, -1.5, -2], [5, 1.5, -2],  [-5, 1.5, -2], 
		[-5,-3,2], [5,-3,2], [5,3,2], [-5,3,2]])
		
ax.scatter3D(v[:, 0], v[:, 1], v[:, 2])

# generate list of sides' polygons of our trapezoidal prism
verts = [ [v[0],v[1],v[5],v[4]], [v[0],v[3],v[7],v[4]],[v[1],v[2],v[6],v[5]],
 [v[2],v[3],v[7],v[6]], [v[4],v[5],v[6],v[7]], [v[0],v[1],v[2],v[3]]]

# plot sides
ax.add_collection3d(Poly3DCollection(verts, 
 facecolors='cyan', linewidths=1, edgecolors='r', alpha=.25))

# Calculate Volume and Surface Area
b1=v[2]-v[1]
b2=v[6]-v[5]
b3=v[5]-v[1]
b4=v[1]-v[0] 

# h = height, l = length
l = b4[0] # 10
h = b3[2] # 4
# a = long base edge, b = short base edge
a = b1[1] # 3
b = b2[1] # 6
# c = d = Slant base edge / hypotenuse
c = (((1/2) * (b - a) ** 2) + (h ** 2)) ** (1/2)
d = c

# Volume of Trapezoidal Prism: 1/2 (h)(a+b)
volume = (1/2) * (h) * (a+b)   
surface_area= l*(a+b+c+d) + ((h)*(a+b))

# Annotation
ax.set_title("Trapezoidal Prism")
ax.text(4.7,0,5.5,"Volume= {}".format(volume), size=10,
                           verticalalignment='center', rotation=270)
ax.text(4.7,0,5,"Surface Area = {}".format(surface_area), size=10,
                           verticalalignment='center', rotation=270)
plt.show()