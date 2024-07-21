import sympy
sympy.init_printing()

import matplotlib.pyplot as plt
t, s = sympy.symbols('t, s')
a = sympy.symbols('a', real=True, positive=True)

def L(f):
    return sympy.laplace_transform(f, t, s, noconds=True)

def invL(F):
    return sympy.inverse_laplace_transform(F, s, t)

# The unit step function is also known as the Heaviside step function.
# We will see this function often in inverse laplace transforms. 
# It is typeset as θ(t) by sympy.

#f1 = sympy.Heaviside(t)
f1 = sympy.exp(-t)*sympy.sin(t)

print('Plot a heaviside θ(t)')
sympy.plot(f1);

# To plot the inverse laplace transform we obtained, 
# which contains the unit step to force it to zero before t=0.
f = sympy.exp(-a*t)
F = sympy.laplace_transform(f, t, s, noconds=True)

invF = invL(F).subs({a: 2})
print('Plot the inverse Laplace Transform of')
sympy.pretty_print(invF)

p = sympy.plot(f.subs({a: 2}), invL(F).subs({a: 2}),
               xlim=(-1, 4), ylim=(0, 3), show=False)
p[1].line_color = 'red'
p.show()
