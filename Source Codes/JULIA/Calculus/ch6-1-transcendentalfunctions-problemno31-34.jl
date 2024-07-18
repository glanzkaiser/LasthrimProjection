using SymPy
@syms x

f1(x) = (x+11)/(sqrt(x^3 - 4))
f2(x) = (x^2 + 3x)*(x-2)*(x^2 + 1)
f3(x) = (sqrt(x+13))/((x-4)*cbrt(2x+1))
f4(x) = (((x^2 + 3)^(2/3))*((3x+2)^2))/(sqrt(x+1))

a1 = diff(f1(x),x)
a2 = diff(f2(x),x)
a3 = diff(f3(x),x)
a4 = diff(f4(x),x)

println("Computing symbolic derivative")
println("a.  ", simplify(a1))
println("b.  ", simplify(a2))
println("c.  ", simplify(a3))
println("d.  ", simplify(a4))
