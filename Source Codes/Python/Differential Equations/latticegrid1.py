# https://stackoverflow.com/questions/33168699/remove-rotation-effect-when-drawing-a-square-grid-of-mxm-nodes-in-networkx-using

import networkx as nx
import matplotlib.pyplot as plt

N = 10
G=nx.grid_2d_graph(N,N)
pos = dict( (n, n) for n in G.nodes() )
# label the nodes from left to right and top to bottom
labels = dict( ((i, j), i + (N-1-j) * 10 ) for i, j in G.nodes() )
# label the nodes from bottom to top, left to right
# labels = dict( ((i, j), i * 10 + j) for i, j in G.nodes() )
nx.draw_networkx(G, pos=pos, labels=labels)

plt.axis('off')
plt.show()
