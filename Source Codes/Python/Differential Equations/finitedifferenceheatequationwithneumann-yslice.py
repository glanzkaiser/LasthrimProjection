# use finite differences to solve the diffusion equation in 3D
# https://stackoverflow.com/questions/63004208/finite-difference-method-for-3d-diffusion-heat-equation

import numpy as np
from matplotlib import pyplot as plt
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D

def get_slices(mx, my, mz):
    jxw, jxp, jxe = slice(0,mx-2), slice(1,mx-1), slice(2,mx)  # west,  center, east
    jys, jyp, jyn = slice(0,my-2), slice(1,my-1), slice(2,my)  # south, center, north
    jzb, jzp, jzt = slice(0,mz-2), slice(1,mz-1), slice(2,mz)  # botoom,center, top
    return jxw, jxp, jxe,   jys, jyp, jyn,    jzb, jzp, jzt

nx, ny, nz = 15, 10, 15
jxw, jxp, jxe, \
jys, jyp, jyn, \
jzb, jzpc, jzt = get_slices(nx, ny, nz)

ax, ay, az = np.arange(nx), np.arange(ny), np.arange(nz)

print('axW', ax[jxw])
print('axP', ax[jxp])
print('axE', ax[jxe])

def get_grid(mx, my, mz, Lx,Ly,Lz):
    ix, iy, iz = Lx*np.linspace(0,1,mx), Ly*np.linspace(0,1,my), Lz*np.linspace(0,1,mz)
    x, y, z = np.meshgrid(ix,iy,iz, indexing='ij')
    print('ix', ix), print('iy', iy), print('iz', iz)
    return x,y,z

    
def init_T(x,y,z):
    T = np.zeros_like(x)
    case = 'xz'
    if case == 'x': T = x
    if case == 'y': T = y
    if case == 'z': T = z
    if case == 'xz': T = x+z
    return T


def set_GradBC(u):
    #--- Neuman BC at bottom boundary ---
    u[:, :, 0] = u[:, :, 1]
    return u


def dT(u,DU):
    DU[jxp,jyp,jzp] = (u[jxe,jyp,jzp] - 2.0*u[jxp,jyp,jzp] + u[jxw,jyp,jzp])*Dx + \
                      (u[jxp,jyn,jzp] - 2.0*u[jxp,jyp,jzp] + u[jxp,jys,jzp])*Dy + \
                      (u[jxp,jyp,jzt] - 2.0*u[jxp,jyp,jzp] + u[jxp,jyp,jzb])*Dz
    return DU

#mmmmmmmmmmmmm main mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
#---- set the parameters ------------------------
dt = 0.01                                    # time step size
nIterations = 5000                           # number of iterations
nx, ny, nz = 40,20,30                       # number of grid points
Lx, Ly, Lz = nx-1, ny-1, nz-1                 # physical grid size
Kx, Ky, Kz = 1, 1, 1                          # diffusion coeficients
dx, dy, dz = Lx/(nx-1), Ly/(ny-1), Lz/(nz-1)  # mesh size
Dx, Dy, Dz = Kx/dx**2, Ky/dy**2, Kz/dz**2     # equation coefficients

#---- initialize the field variables -----------------
x,y,z = get_grid(nx, ny, nz, Lx,Ly,Lz)       # generate the grid
T = init_T(x,y,z)                            # initialize the temperature
DT = np.zeros_like(T)                        # initialize the change of temperature
jxw, jxp, jxe, \
jys, jyp, jyn, \
jzb, jzp, jzt = get_slices(nx, ny, nz)       # slices for finite differencing

#---- run the solving algorithm ----------------------
for jter in range(nIterations):
    T = set_GradBC(T)              # set Neumann boundary condition
    T = T + dt*dT(T,DT)            # update


def plot_y_slice(JY1, x,y,z,T):
    T2 = T[:,JY1,:]
    X =  x[:,JY1,:]
    Z =  z[:,JY1,:]

    fig = plt.figure(figsize=(15,15))
    ax = fig.add_subplot(111)
    ax.set_aspect('equal')
    plt.contourf(X,Z,T2, 40,cmap=cm.coolwarm, alpha=0.99)
    plt.colorbar()
    plt.xlabel("x")
    plt.ylabel("")
    plt.savefig("y_slice.png")
    plt.show()
    
JY1 = 10
plot_y_slice(JY1, x,y,z,T)
