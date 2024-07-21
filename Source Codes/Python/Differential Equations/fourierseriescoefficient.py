# Author: Manas Sharma
# Website: www.bragitoff.com
# Email: manassharma07@live.com
# License: MIT

import numpy as np
import scipy.integrate as integrate

# Non-periodic sawtooth function defined for a range [-l,l]
def sawtooth(x):
	return x

# Non-periodic square wave function defined for a range [-l,l]
def square(x):
	if x>0:
		return np.pi
	else:
		return -np.pi
# Non-periodic triangle wave function defined for a range [-l,l]
def triangle(x):
	if x>0:
		return x
	else:
		return -x
# Non-periodic cycloid wave function defined for a range [-l,l]
def cycloid(x):
	return np.sqrt(np.pi**2-x**2)
#Fourier Series Coefficients
#The following function returns the fourier coefficients,'a0/2', 'An' & 'Bn'
#
#User needs to provide the following arguments:
#
#l=periodicity of the function f which is to be approximated by Fourier Series
#n=no. of Fourier Coefficients you want to calculate
#f=function which is to be approximated by Fourier Series
#
#*Some necessary guidelines for defining f:
#*The program integrates the function f from -l to l so make sure you define the function f correctly in the interval -l to l.
#
#for more information on Fourier Series visit: https://en.wikipedia.org/wiki/Fourier_series
#
#Written by: Manas Sharma(manassharma07@live.com)
#For more useful tutorials on Python visit: https://www.bragitoff.com/category/compu-geek/python/
def fourier(li, lf, n, f):
	l = (lf-li)/2
	# Constant term
	a0=1/l*integrate.quad(lambda x: f(x), li, lf)[0]
	# Cosine coefficents
	A = np.zeros((n))
	# Sine coefficents
	B = np.zeros((n))

	for i in range(1,n+1):
		A[i-1]=1/l*integrate.quad(lambda x: f(x)*np.cos(i*np.pi*x/l), li, lf)[0]
		B[i-1]=1/l* integrate.quad(lambda x: f(x)*np.sin(i*np.pi*x/l), li, lf)[0]
	return [a0/2.0, A, B]

if __name__ == "__main__":
	# Limits for the functions
	li = -np.pi
	lf = np.pi
	# Number of harmonic terms
	n = 3
	# Fourier coeffficients for various functions
	coeffs = fourier(li,lf,n,sawtooth)
	print('Fourier coefficients for the Sawtooth wave\n')
	print('a0 ='+str(coeffs[0]))
	print('an ='+str(coeffs[1]))
	print('bn ='+str(coeffs[2]))
	print('-----------------------\n\n')

	coeffs = fourier(li,lf,n,square)
	print('Fourier coefficients for the Square wave\n')
	print('a0 ='+str(coeffs[0]))
	print('an ='+str(coeffs[1]))
	print('bn ='+str(coeffs[2]))
	print('-----------------------\n\n')

	coeffs = fourier(li,lf,n,triangle)
	print('Fourier coefficients for the Triangular wave\n')
	print('a0 ='+str(coeffs[0]))
	print('an ='+str(coeffs[1]))
	print('bn ='+str(coeffs[2]))
	print('-----------------------\n\n')

	coeffs = fourier(li,lf,n,cycloid)
	print('Fourier coefficients for the Cycloid wave\n')
	print('a0 ='+str(coeffs[0]))
	print('an ='+str(coeffs[1]))
	print('bn ='+str(coeffs[2]))
	print('-----------------------\n\n')