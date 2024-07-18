from plotly.offline import iplot, init_notebook_mode
from plotly.graph_objs import Mesh3d
import plotly.graph_objects as go
import numpy as np

# some math: generate points on the surface of the ellipsoid

phi = np.linspace(0, 1*np.pi)
theta = np.linspace(-np.pi/2, 3.14/2)
phi, theta=np.meshgrid(phi, theta)

x = np.cos(theta) * np.sin(phi) * 3
y = np.cos(theta) * np.cos(phi) * 2
z = np.sin(theta)

fig = go.Figure(data=[go.Mesh3d({
                'x': x.flatten(), 
                'y': y.flatten(), 
                'z': z.flatten(), 
                'alphahull': 0
})])
  
fig.show()