using SymPy
@syms x

f(x) = (15/512)*(x^2)*((4-x)^2)
μ = 2
v1(x) = ((x-μ)^2)*f(x)

# with direct method
Vx1 = integrate((v1(x)), (x, 0, 4))

println("V(X) = ", Vx1)