# Create half cylinder

using PyCall

ENV["PYTHON"] = "/home/browni/.julia/conda/3/bin/python3"
# the path is from the command 'which python3'

py"""

from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection, Line3DCollection
import numpy as np

def data_for_cylinder_along_z(center_x,center_y,radius,height_z):
    z = np.linspace(0, height_z, 50)
    theta = np.linspace(0, 1*np.pi, 50)
    theta_grid, z_grid=np.meshgrid(theta, z)
    x_grid = radius*np.cos(theta_grid) + center_x
    y_grid = radius*np.sin(theta_grid) + center_y
    return x_grid,y_grid,z_grid

def data_for_horizontal_plane(center_x, center_y, radius, height_z):
    # define the horizontal surface using polar coordinates
    _radius = np.linspace(0, radius)
    _theta = np.linspace(0, np.pi)
    R, T = np.meshgrid(_radius, _theta)
    # convert polar to cartesian coordinates and add translation
    X = R*np.cos(T) + center_x
    Y = R*np.sin(T) + center_y
    Z = np.zeros(X.shape) + height_z
    return X, Y, Z

def data_for_vertical_plane(center_x, center_y, radius, height_z):
    # define the vertical rectangle on the X-Z plane
    x = np.linspace(center_x - radius, center_x + radius)
    z = np.linspace(0, height_z)
    X, Z = np.meshgrid(x, z)
    Y = np.zeros(X.shape) + center_y
    return X, Y, Z

import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

Xc,Yc,Zc = data_for_cylinder_along_z(0.2,0.2,3,10)
ax.plot_surface(Xc, Yc, Zc, alpha=0.5, color='cornflowerblue')

X, Y, Z = data_for_horizontal_plane(0.2, 0.2, 3, 0.0)
ax.plot_surface(X, Y, Z, alpha=0.5, color='cornflowerblue')
X, Y, Z = data_for_horizontal_plane(0.2, 0.2, 3, 10)
ax.plot_surface(X, Y, Z, alpha=0.5, color='cornflowerblue')
X, Y, Z = data_for_vertical_plane(0.2, 0.2, 3, 10)
ax.plot_surface(X, Y, Z, alpha=0.5, color='cornflowerblue')

r = 3
h = 10
volume = 2*(np.pi)*(r ** 2)*(h)
surface_area = 2*(np.pi)*(r)*(h) + 2*(np.pi)*(r ** 2)
# Annotation
ax.set_title("Half Cylinder")
# A cylinder's volume is π r² h, and its surface area is 2π r h + 2π r².
ax.text(4.7,0,21.5,"Volume= {}".format(volume), size=10,
                           verticalalignment='center', rotation=270)
ax.text(4.7,0,20.5,"Surface Area = {}".format(surface_area), size=10,
                           verticalalignment='center', rotation=270)
plt.show()

"""