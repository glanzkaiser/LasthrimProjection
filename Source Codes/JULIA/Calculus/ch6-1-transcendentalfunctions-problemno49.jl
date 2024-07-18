using SymPy
@syms x, a, b, c, t, u

c = (a^2 - b^2)/(2*a*b)
d = ((a*x -b)/(a*x+b))^c
f1(x) = log(d)

u = log(x^2 + x - 1)
f2(x) = integrate((cos(t)^2), (t, 1, u))

a1 = diff(f1(x),x)
a2 = diff(f2(x),x)

println("Computing symbolic derivative")
print("a. ", simplify(a1))
println(" = ", simplify(a1(x=>1)))
print("b.  ", simplify(a2))
println(" = ", a2(1))
