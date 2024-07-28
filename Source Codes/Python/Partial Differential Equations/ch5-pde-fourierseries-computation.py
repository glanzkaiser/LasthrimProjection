#  https://docs.sympy.org/latest/modules/series/fourier.html

from sympy import pi
import sympy as sm

x = sm.symbols("x")

# Computing Fourier Series
# This illustrates how truncating to the higher order gives better convergence.

g = x
s = sm.fourier_series(g, (x, -pi, pi))
print('')
print('Fourier series for f(x) = x over the interval (-π,π) : ')
sm.pretty_print(s)

s1 = s.truncate(n = 3)
s2 = s.truncate(n = 5)
s3 = s.truncate(n = 7)

print('')
print('Fourier series for f(x) = x over the interval (-π,π) with n=3 : ')
sm.pretty_print(s1)
print('')
print('Fourier series for f(x) = x over the interval (-π,π) with n=5 : ')
sm.pretty_print(s2)
print('')
print('Fourier series for f(x) = x over the interval (-π,π) with n=7 : ')
sm.pretty_print(s3)

p = sm.plot(g, s1, s2, s3, (x, -4*pi, 4*pi), show=False, title='Fourier series for f(x)=x on [-π,π]', legend=True)

p[0].line_color = 'g'
p[0].label = 'x'


p[1].line_color = 'r'
p[1].label = 'n=3'

p[2].line_color = 'b'
p[2].label = 'n=5'

p[3].line_color = 'cyan'
p[3].label = 'n=7'

p.show()