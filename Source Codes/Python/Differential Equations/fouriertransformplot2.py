import numpy as np
import matplotlib.pyplot as plt
import scipy.fftpack

# Number of samplepoints
N = 600
t = np.arange(0.0, 20.0, 0.1)
# sample spacing
T = 3.0
x = np.linspace(-3.0, N*T, N)
y = np.exp(-x)*np.sin(x)
yf = scipy.fftpack.fft(y)
xf = np.linspace(-3.0, T, N//2)

yt = np.exp(-t)*np.sin(t)

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14,7))

# Plot the X(ω)
ax1.plot(-4*np.pi*xf, 2.0/N * np.abs(yf[:N//2]))
ax1.set_title("$FT\{f(x)\}$")

# Plot the x(t)
ax2.plot(t,yt)
ax2.set_title("$f(x) = exp(-x)sin(x)$")
ax2.set_xticks([0, np.pi, 2 * np.pi])
plt.show()