# https://neutrinobh.medium.com/plotting-vector-fields-using-matplotlib-in-three-steps-with-examples-4ef30ddc68cd
# We want to visualize vector field 
# F = xi + 3yj
# around origin — point (0,0), 
# going from x-range(-5,5) and y — range (-5,5). 

#Plotting vector fields
import matplotlib.pyplot as plt
import numpy as np

x,y = np.meshgrid(np.linspace(-5,5,10),np.linspace(-5,5,10))

u = 2*x*y/8; v = y**2/8

fig, ax = plt.subplots(figsize=(10,6))
q = ax.quiver(x, y, u, v)
ax.set_title(r'Vector field $\vec{F} = \frac{1}{8}(2xy\vec{i}+y^2\vec{j})$')
ax.quiverkey(q, 0.8, 0.9, 1, r'unit length', labelpos='E',
                   coordinates='figure')

fig.savefig('vectorfield2.png')
plt.show()