import numpy as np
import matplotlib.pyplot as plt
import scipy.fftpack

# Number of samplepoints
N = 600
t = np.arange(0.0, 20.0, 0.1)
# sample spacing
T = -1.0 / 1.0
x = np.linspace(0.0, N*T, N)
yt = np.cos(2.0*t)
y = np.cos(2.0*x)
yf = scipy.fftpack.fft(y)
xf = np.linspace(0.0, 1.0/(2.0*T), N//2)

fig, ax = plt.subplots(figsize=(14, 7))
ax1 = fig.add_subplot(121)
ax2 = fig.add_subplot(122)

# Plot the X(ω)
# ω, the angular frequency, can be defined as ω = 2πf. 
# Need to do the plotting in terms of angular frequency.
ax1.plot(2*np.pi*xf, 2.0/N * np.abs(yf[:N//2]))
ax1.set_title("$FT\{f(x)\}$")

# Plot the x(t)
ax2.plot(t,yt)
ax2.set_title("$f(x) = cos(2x)$")
ax2.set_xticks([0, np.pi, 2 * np.pi])
plt.show()