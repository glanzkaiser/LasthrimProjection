using SymPy
@syms x

f1(x) = log(3x^3 + 2x)
f2(x) = log((x-4)^3)
f3(x) = log(sqrt(3x-2))
f4(x) = (x^2) * log(x)
f5(x) = ((x^2)*log(x^2)) + (log(x))^3
f6(x) = log(x)/((x^2)*(2log(x))) + (-log(x))^3
f7(x) = log(x + sqrt(x^2 + 1))
f8(x) = log(x + sqrt(x^2 - 1))
f9(x) = log(cbrt(x))
f10(x) = log(cos(x))

a1 = diff(f1(x),x)
a2 = diff(f2(x),x)
a3 = diff(f3(x),x)
a4 = diff(f4(x),x)
a5 = diff(f5(x),x)
a6 = diff(f6(x),x)
a7 = diff(f7(x),x)
a8 = diff(f8(x),x)
a9 = diff(f9(x),x)
a10 = diff(f10(x),x)

println("Computing symbolic derivative")
println("a.  ", a1)
println("b.  ", a2)
println("c.  ", a3)
println("d.  ", a4)
println("e.  ", a5)
println("f.  ", simplify(a6))
println("g.  ", simplify(a7))
println("h.  ", simplify(a8))
println("i.  ", a9(81))
println("j.  ", a10(pi/4))
