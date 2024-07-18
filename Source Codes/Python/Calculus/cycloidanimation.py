# https://stackoverflow.com/questions/53710119/how-to-draw-cycloid-on-curve-of-other-function-other-cycloid
import numpy as np
import matplotlib.pyplot as plt
import math

from matplotlib import animation

r = float(input('write r\n'))
R = float(input('write R\n'))
#r=1
#R=0.1
x  = []
y  = []
x2 = []
y2 = []

x_1=0
x_2=0


lengthX=[0]
lengthY=[0]
lengthabs=[0]

fig, ax = plt.subplots()
ln, = plt.plot([], [], 'r', animated=True)
f = np.linspace(0, 2*math.pi, 1000)

def init():
    ax.set_xlim(-r,  4*r*math.pi)
    ax.set_ylim(0, 4*r)
    return ln,

def update2(frame):
    #cycloid's equations
    x0 = r * (frame - math.sin(frame))
    y0 = r * (1 - math.cos(frame))
    x.append(r * (frame - math.sin(frame)))
    y.append(r * (1 - math.cos(frame)))

    #arc's length
    lengthabs.append(math.sqrt((x0-lengthX[-1])*(x0-lengthX[-1])+(y0-lengthY[-1])*(y0-lengthY[-1])))
    lengthX.append(x0)
    lengthY.append(y0)
    dl=sum(lengthabs)
    param = dl / R

    #center of circle
    center1x = r * (frame - math.sin(frame)) + R * math.cos((frame+2*math.pi) / 2)
    center1y = r * (1     - math.cos(frame)) - R * math.sin((frame+2*math.pi) / 2)

    if(frame<2*math.pi):
        W1x = center1x + R * math.cos(-param)
        W1y = center1y + R * math.sin(-param)
    else:
        W1x = center1x + R * math.cos(param)
        W1y = center1y + R * math.sin(param)

    x2.append(W1x)
    y2.append(W1y)
    ln.set_data([x,x2], [y,y2])
    return ln,

ani = animation.FuncAnimation(fig, update2, frames=f,init_func=init, blit=True, interval = 0.1, repeat = False)
plt.show()