using SymPy

y, a = symbols("y a")

b = symbols("b")

h = integrate(a*y^2, (y, 0, b))

d = simplify(sqrt(h/(a*b)))
println("c = ", d)
