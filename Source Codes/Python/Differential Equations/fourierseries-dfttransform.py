# https://github.com/rubinhlandau/CompPhysicsNotebooks/blob/master/CP12.ipynb
# DFT
# uses the built-in complex numbers of Python to compute the 
# discrete Fourier transform for the signal in method f(signal).

from numpy import *
import numpy as np
import matplotlib.pyplot as plt

N = 1000
Np = N                           # Number points
signal = zeros( (N+1), float )     
twopi  = 2.*pi
sq2pi = 1./sqrt(twopi)
h = twopi/N
dftz = zeros( (Np), complex )    # sequence complex elements
signal=np.zeros( (N+1), float)   # Original signal
trimag=np.zeros( (N+1), float)   # Imaginary part transform
trreal=np.zeros( (N+1), float)   #  Real part transform
xx=np.zeros((N+1),float)
ytri=[]
xtri=[]
ytre=[]
xtre=[]
def f(signal):                                                      # signal function
    step = twopi/N
    x = 0. 
    for i in range(0, N+1):
        signal[i] = (1+2*sin(x+2)+3*sin(4*x+2))*(1+2*sin(x+2)
                    + 3*sin(4*x + 2.))
        xx[i]=x
        x += step
f(signal) 

def fourier(dftz,xtri,ytri,xtre,ytre):           # DFT
    #global yist,hist
    for n in range(0, Np):              
        zsum = complex(0.0, 0.0)         # real and imag parts = zero
        for  k in range(0, N):                 # loop for sums
            zexpo = complex(0, twopi*k*n/N)    # complex exponent
            zsum += signal[k]*exp(-zexpo)      # Fourier transform core
        dftz[n] = zsum * sq2pi                 # factor
        ar=dftz[n].real
        trreal[n]=ar
        if dftz[n].imag >0.01:            # plot if not too small imag
            trimag[n]=dftz[n].imag        # plot bars
            xtri=xtri+[n]
            ytri=ytri+[trimag[n]]
            #print(n,yhist)
        if (dftz[n].real > 0.01 and n<900):    # plot the real part
            trreal[n]=dftz[n].real 
            xtre=xtre+[n]
            ytre=ytre+[trreal[n]]
            #print(n,trreal[n])
    return xtri,ytri,xtre,ytre        
xtri,ytri,xtre,ytre=fourier(dftz,xtri,ytri,xtre,ytre) 
fig=plt.figure()
ax1=fig.add_subplot(3,1,1)  
ax1.plot(xx,signal,'r')

plt.title('Signal')
plt.xlabel('x')
plt.ylabel('signal')
plt.tight_layout()

ax2=fig.add_subplot(3,1,2)
ax2.bar(xtri,ytri,0.1)
plt.title('Imaginary part transform')
plt.ylabel('Imag')

ax3=fig.add_subplot(3,1,3)
ax3.bar(xtre,ytre,0.1)
plt.title('Real part transform')
plt.xlabel('frequency')
plt.ylabel('Real')
plt.tight_layout()

plt.show()
