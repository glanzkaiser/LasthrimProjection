# https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.15/derivatives/implicit_differentiation.html
using SymPy
@syms x, y, u()
# ex is f(x,y) / f(t,y) / the general solution in this term f(x,y)=c / f(t,y)=c
# To express that y is a locally a function of x, we use a "symbolic function" object: u()
# The object u is the symbolic function
# u(x) a symbolic expression involving a symbolic function. 
# This is what we will use to refer to y.
# Assume is a function of , called u(x), this substitution is just a renaming
# For general solution: y(x) = c exp(0.1x^2)
ex = y/(exp(0.1*x^2))
ex1 = ex(y => u(x))

#  we differentiate both sides in x:
ex2 = diff(ex1, x)

# solve for dy/dx
dydx = diff(u(x), x)
ex3 = solve(ex2, dydx)[1]    # pull out lone answer with [1] indexing

# As this represents an answer in terms of u(x), 
# we replace that term with the original variable:
dydx₁ = ex3(u(x) => y)

println("Find dy/dx using Implicit Differentiation with Julia")
println("f(x,y): ", ex)
println("")

println("dy/dx: ", dydx₁)