# https://pythonnumericalmethods.berkeley.edu/notebooks/chapter24.02-Discrete-Fourier-Transform.html

#  Generate 3 sine waves with frequencies 1 Hz, 4 Hz, and 7 Hz, 
# amplitudes 3, 1 and 0.5, and phase all zeros. 
# Add this 3 sine waves together with a sampling rate 100 Hz

import matplotlib.pyplot as plt
import numpy as np

plt.style.use('seaborn-poster')

# sampling rate
sr = 100
# sampling interval
ts = 1.0/sr
t = np.arange(0,1,ts)

freq = 1.
x = 3*np.sin(2*np.pi*freq*t)

freq = 4
x += np.sin(2*np.pi*freq*t)

freq = 7   
x += 0.5* np.sin(2*np.pi*freq*t)

# Write a function DFT(x) which takes in one argument, 
# x - input 1 dimensional real-valued signal. 
# The function will calculate the DFT of the signal and return the DFT values. 

def DFT(x):
    """
    Function to calculate the 
    discrete Fourier Transform 
    of a 1D real-valued signal x
    """

    N = len(x)
    n = np.arange(N)
    k = n.reshape((N, 1))
    e = np.exp(-2j * np.pi * k * n / N)
    
    X = np.dot(e, x)
    
    return X

X = DFT(x)

# calculate the frequency
N = len(X)
n = np.arange(N)
T = N/sr
freq = n/T 

n_oneside = N//2
# get the one side frequency
f_oneside = freq[:n_oneside]

# normalize the amplitude
X_oneside =X[:n_oneside]/n_oneside

ax = plt.figure().add_subplot(projection='3d')

# Plot a sin curve using the x and y axes.
x1 = 3*np.sin(2*np.pi*freq*t)
x2 = np.sin(2*np.pi*freq*t)
x3 = 0.5* np.sin(2*np.pi*freq*t)

# The axis direction for the zs. 
# This is useful when plotting 2D data on a 3D Axes. 
# The data must be passed as xs, ys. 
# Setting zdir to 'y' then plots the data to the x-z-plane.

ax.set_ylim(0, 10)
ax.plot(t, x, zs=-2, zdir='y', label='DFT(x)')
ax.plot(t, x2, zs=4, zdir='y', label='$\sin (2πt)$')
ax.plot(t, x1, zs=1, zdir='y', label='$3 \sin (2πt)$')
ax.plot(t, x3, zs=7, zdir='y', label='$0.5 \sin (2πt)$')

x4 = [1.2] * n_oneside # Create array of 2 with length of 10
y4 = f_oneside
z4 = abs(X_oneside)
ax.stem(x4, y4, z4, basefmt="-b", label='DFT Amplitude |X(freq)|')

ax.set_title('Discrete Fourier Transform')
ax.legend(loc='upper left', bbox_to_anchor=[-0.51, 0.5])

ax.set_xlabel('Time domain', fontweight='bold', fontsize=10, labelpad=20)
ax.set_ylabel('Frequency domain', fontweight='bold', fontsize=10, labelpad=20)
ax.set_zlabel('Amplitude', fontweight='bold', fontsize=10, labelpad=20)
ax.view_init(elev=20., azim=-35)

plt.show()
