using SymPy

x, a, b = symbols("x a b")

A, B = symbols("A B")

g = integrate(a*x+b, (x, A, B))

d = simplify((g/(B-A) -b)/a)
println("c = ", d)
