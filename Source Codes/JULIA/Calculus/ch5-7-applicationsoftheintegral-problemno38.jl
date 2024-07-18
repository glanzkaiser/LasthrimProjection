using SymPy
@syms x

f(x) = (3/256)*(x)*(8-x)
e2(x) = (x^2)*f(x)
e3(x) = (x^3)*f(x)

# with direct method
Ex2 = integrate((e2(x)), (x, 0, 8))
Ex3 = integrate((e3(x)), (x, 0, 8))

println("a. E(X^{2}) = ", Ex2)
println("b. E(X^{3}) = ", Ex3)