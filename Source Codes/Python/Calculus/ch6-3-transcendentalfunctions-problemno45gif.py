# https://stackoverflow.com/questions/36464982/ploting-solid-of-revolution-in-python-3-matplotlib-maybe
# R is a region in the xy plane bounded by y = exp(x), x = 0, x = ln 3, and y = 0
# Create the animation of A solid of revolution that is formed by rotating R around the x axis. 
import gif
import numpy as np
import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d.axes3d as axes3d

@gif.frame
def plot_volume(angle):
    fig = plt.figure(figsize = (20, 15))

    ax2 = fig.add_subplot(1, 1, 1, projection = '3d')
    angles = np.linspace(0, 360, 20)
    x = np.linspace(0, np.log(3), 60)
    v = np.linspace(0, 2*angle, 60)

    U, V = np.meshgrid(x, v)
    Y1 = np.exp(U)*np.cos(V)
    Z1 = np.exp(U)*np.sin(V)
    X = U
    ax2.plot_surface(X, Y1, Z1, alpha = 0.2, color = 'blue', rstride = 6, cstride = 6)
    ax2.set_xlim(-2,5)
    ax2.set_ylim(-2.5,2.5)
    ax2.set_zlim(-2,2)
    ax2.view_init(elev = 50, azim = 30*angle)
    ax2.plot_wireframe(X, Y1, Z1, color = 'black')
    ax2._axis3don = False

frames = []
for i in np.linspace(0, 2*np.pi, 20):
    frame = plot_volume(i)
    frames.append(frame)

gif.save(frames, '/home/browni/LasthrimProjection/Python/solidofrevolution1.gif', duration = 500)