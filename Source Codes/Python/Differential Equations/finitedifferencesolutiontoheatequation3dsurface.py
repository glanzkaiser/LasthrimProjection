# https://stackoverflow.com/questions/62501989/finite-difference-solution-to-heat-equation
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm
import math as mth
from mpl_toolkits.mplot3d import Axes3D
import pylab as plb
import scipy as sp
import scipy.sparse as sparse
import scipy.sparse.linalg

# First start with diffusion equation 
# with initial condition: u(x, 0) = 4x - 4x^2 
# Initial conditions: The initial temperature profile u(x,0) = f (x) for 0 < x < L.
# Boundary conditions: u(0, t) = u(L, t) = 0 (at either side of the rod will have 0 degree)
# Boundary conditions: Specific behavior at x0 = 0,L
# represent either a known physical state, 
# such as temperature, or an amount of heat entering or leaving the device, heat flux

# Discretise the domain [0, L] X [0, T]
# Then discretise the derivatives
# Generate algorithm:
# 1. Compute initial condition for all i
# 2. For all n:
#    2i. Compute u_i^{n + 1} for internal space points
#   2ii. Set boundary values for i = 0 and i = N_x
#
# Look at the differential equation, the numerics become unstable for a>0.5
# Translated this means that roughly N > 190.

M = 50 # number of grid points for space interval
N = 1000 # ''     '' ''   ''     ''  time ''
x0 = 0
xL = 1 # unit grid differences

dx = (xL - x0) / (M - 1) # space step
t0 = 0
tF = 0.2
dt = (tF - t0) / (N - 1)

D = 0.3 # thermal diffusivity 
a = D * dt / dx**2

# Create grid
tspan = np.linspace(t0, tF, N)
xspan = np.linspace(x0, xL, M)

# Initial matrix solution
U = np.zeros((M, N))

# Initial condition
U[:, 0] = 4*xspan - 4*xspan**2
# Boundary conditions
U[0, :] = 0
U[-1, 0] = 0

# Discretised derivative formula
for k in range(0, N-1):
    for i in range(1, M-1):
        U[i, k+1] = a * U[i-1, k] + (1 - 2 * a) * U[i, k] + a * U[i + 1, k]

T, X = np.meshgrid(tspan, xspan)

fig = plt.figure()
ax = fig.gca(projection='3d')

surf = ax.plot_surface(T, X, U, cmap=cm.coolwarm,
                       linewidth=0, antialiased=False)

ax.set_xticks([0, 0.05, 0.1, 0.15, 0.2])

ax.set_xlabel('Time (t)')
ax.set_ylabel('Space (x)')
ax.set_zlabel('U(x,t)')
plt.tight_layout()
fig.colorbar(surf, location='left', shrink=0.3, aspect=10)
plt.show()