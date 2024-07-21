import sympy
sympy.init_printing()

import matplotlib.pyplot as plt

t, s = sympy.symbols('t, s')
a = sympy.symbols('a', real=True, positive=True)

f = sympy.exp(-a*t)

g = sympy.integrate(f*sympy.exp(-s*t), (t, 0, sympy.oo))

sympy.pretty_print(f)
print('the integral of', f)
sympy.pretty_print(g)

ltf = sympy.laplace_transform(f, t, s)
# If we want just the function use F
F = sympy.laplace_transform(f, t, s, noconds=True)
print('the Laplace Transform of', f)
sympy.pretty_print(ltf)

def L(f):
    return sympy.laplace_transform(f, t, s, noconds=True)
def invL(F):
    return sympy.inverse_laplace_transform(F, s, t)

invf = invL(F)
print('the inverse Laplace Transform of', F)
sympy.pretty_print(invf)

F = ((s + 1)*(s + 2)* (s + 3))/((s + 4)*(s + 5)*(s + 6))


print('the inverse Laplace Transform of')
sympy.pretty_print(F)
print('or')
sympy.pretty_print(F.apart(s))
print('is:')

invf2 = invL(F).simplify()
# invf2 = invL(F.apart(s))
sympy.pretty_print(invf2)

