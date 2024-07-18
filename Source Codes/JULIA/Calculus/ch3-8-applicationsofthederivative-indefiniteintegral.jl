# To compute an indefinite integral
using SymPy

# we can also use @vars x y z
x = symbols("x")

# diff(cos(x), x)
# diff(exp(x**2), x)
# save for ** becoming ^ this is the same

# first integral
integrate(cbrt(x^4))
# second integral
integrate(integrate(cbrt(x^4)))
