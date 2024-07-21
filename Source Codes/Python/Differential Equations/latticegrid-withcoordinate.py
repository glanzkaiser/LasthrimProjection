# https://stackoverflow.com/questions/33168699/remove-rotation-effect-when-drawing-a-square-grid-of-mxm-nodes-in-networkx-using

import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

G = nx.grid_2d_graph(4,4)
pos = dict( (n, n) for n in G.nodes() )
nx.draw_networkx(G, pos=pos, node_size=2000)
print('Lattice plot:')
plt.axis('off')
plt.show()

print('Lattice with arrow:')
grid = {  # point(x, y), outgoing connections [points] 
    (0, 0): [(0, 1), (1, 0)],
    (0, 1): [],
    (1, 0): [],
    (1, 1): [(1, 0), (0, 1)]
}

w = 0.005  # Errorwidth
h = 0.05   # Errorhead width

fig, ax = plt.subplots()
for point, connections in grid.items():
    for outgoing in connections:
        dx = outgoing[0] - point[0]
        dy = outgoing[1] - point[1]
        ax.arrow(point[0], point[1],
                 dx / 2, dy / 2,
                 width=w, head_width=h,
                 facecolor="k",
                 zorder=0)
        ax.arrow(point[0] + dx / 2,
                 point[1] + dy / 2,
                 dx / 2, dy / 2,
                 width=w, head_width=0,
                 facecolor="k",
                 zorder=0)
    ax.plot(*point,
            marker="o", markersize=10, markeredgecolor="k",
            markerfacecolor="red",
            zorder=1)
plt.show()

print('Lattice with quiver arrow:')
def plot_vector(p1,p2):
    p1 = np.array(p1)
    p2 = np.array(p2)
    dp = p2-p1
    plt.quiver(p1[0], p1[1], dp[0], dp[1],angles='xy', scale_units='xy', scale=1, headwidth = 5, headlength = 7)


grid = {  # point(x, y), outgoing connections [points] 
    (0, 0): [(0, 1), (1, 0)],
    (0, 1): [],
    (1, 0): [],
    (1, 1): [(1, 0), (0, 1)]
}


fig, ax = plt.subplots()
for point, connections in grid.items():
    for outgoing in connections:
        plot_vector(point,outgoing)
    plt.plot(*point,
            marker="o", markersize=10, markeredgecolor="k",
            markerfacecolor="red",
            zorder=1)
plt.show()