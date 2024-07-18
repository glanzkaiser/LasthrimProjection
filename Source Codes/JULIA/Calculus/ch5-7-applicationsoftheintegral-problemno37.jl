using SymPy
@syms x

f(x) = (15/512)*(x^2)*((4-x)^2)
e1(x) = x*f(x)
e2(x) = (x^2)*f(x)

# with direct method
Ex = integrate((e1(x)), (x, 0, 4))
Ex2 = integrate((e2(x)), (x, 0, 4))

println("a. E(X) = ", Ex)
println("b. E(X^{2}) = ", Ex2)