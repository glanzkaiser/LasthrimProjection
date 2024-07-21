# https://neutrinobh.medium.com/plotting-vector-fields-using-matplotlib-in-three-steps-with-examples-4ef30ddc68cd
# We want to visualize vector field 
# F = xi + 3yj
# around origin — point (0,0), 
# going from x-range(-5,5) and y — range (-5,5). 

import numpy as np
import matplotlib.pyplot as plt

x,y = np.meshgrid(np.linspace(-5,5,10),np.linspace(-5,5,10))
u = x; v = 3*y
fig, ax = plt.subplots()
q = ax.quiver(x, y, u, v)
plt.show()

