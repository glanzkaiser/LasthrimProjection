# To compute an indefinite integral
using SymPy

# we can also use @vars x y z
#x = symbols("x")
@syms x y::real

integrate(abs(x),x)
integrate(abs(y),y)