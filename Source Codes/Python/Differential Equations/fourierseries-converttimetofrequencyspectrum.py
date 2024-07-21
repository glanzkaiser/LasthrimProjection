# http://www.ritchievink.com/blog/2017/04/23/understanding-the-fourier-transform-by-example/

# Examples of time spectra are sound waves, electricity, mechanical vibrations etc.
# Every non-linear function can be represented as a sum of (infinite) sine waves.
# A step function is simulated by a multitude of sine waves.

import numpy as np
import matplotlib.pyplot as plt

def DFT(x):
    """
    Compute the discrete Fourier Transform of the 1D array x
    :param x: (array)
    """

    N = x.size
    n = np.arange(N)
    k = n.reshape((N, 1))
    e = np.exp(-2j * np.pi * k * n / N)
    return np.dot(e, x)

# a simple signal containing an addition of two sine waves. 
# One with a frequency of 40 Hz and one with a frequency of 90 Hz.

t = np.linspace(0, 0.5, 500)
s = np.sin(40 * 2 * np.pi * t) + 0.5 * np.sin(90 * 2 * np.pi * t)

# In order to retrieve a spectrum of the frequency of the time signal mentioned above
# we must take a FFT on that sequence.
fft = np.fft.fft(s)

for i in range(2):
    print("Value at index {}:\t{}".format(i, fft[i + 1]), "\nValue at index {}:\t{}".format(fft.size -1 - i, fft[-1 - i]))



fft = np.fft.fft(s)
T = t[1] - t[0]  # sampling interval 
N = s.size

# 1/T = frequency
f = np.linspace(0, 1 / T, N)

# Plotting time
plt.figure(figsize = (12, 10))
plt.subplot(2, 1, 1)
plt.ylabel("Amplitude")
plt.xlabel("Time [s]")
plt.plot(t, s)

plt.subplot(2, 1, 2)
plt.ylabel("Amplitude")
plt.xlabel("Frequency [Hz]")
plt.bar(f[:N // 2], np.abs(fft)[:N // 2] * 1 / N, width=1.5)  # 1 / N is a normalization factor
plt.show()

# To keep information about time and frequencies in one spectrum, we must make a spectrogram
