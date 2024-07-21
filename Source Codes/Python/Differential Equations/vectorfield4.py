# https://neutrinobh.medium.com/plotting-vector-fields-using-matplotlib-in-three-steps-with-examples-4ef30ddc68cd

#Plotting vector fields
import matplotlib.pyplot as plt
import numpy as np

x,y = np.meshgrid(np.linspace(-5,5,10),np.linspace(-5,5,10))

u = x; v = 3*y

fig, ax = plt.subplots(figsize=(10,6))
q = ax.quiver(x[::2], y[::2], u[::2], v[::2])

ax.set_title(r'Vector field $\vec{F} = x\vec{i}+3y\vec{j})$')
ax.quiverkey(q, 0.8, 0.9, 5, r'3 unit lengths', labelpos='E',
                   coordinates='figure')

fig.savefig('vectorfield.png')
plt.show()