# https://stackoverflow.com/questions/74935610/fourier-series-animation-effect-using-by-python-artistanimation

import numpy as np
import matplotlib.pyplot as plt
from sympy import *
x = Symbol('x')


fx=0
j=10

for i in range(1,j):
    fx=fx+(2)/(np.pi*i)*(1-cos(i*np.pi))*(sin(i*x))
    y_func=lambdify(x, fx, "numpy")
    x_val=np.linspace(-np.pi,np.pi,315)
    y_val=y_func(x_val)
    plt.plot(x_val,y_val)
plt.show()