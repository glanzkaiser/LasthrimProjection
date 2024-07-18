using SymPy
@syms x

f1(x) = exp(sqrt(x+2))
f2(x) = exp(-1/x^2)
f3(x) = exp(2*log(x))
f4(x) = exp(x/log(x))
f5(x) = (x^3)*exp(x)
f6(x) = exp((x^3)*log(x))
f7(x) = sqrt(exp(x^2)) + exp(sqrt(x^2))
f8(x) = exp(1/x^2) + (1/exp(x^2))

a1 = diff(f1(x),x)
a2 = diff(f2(x),x)
a3 = diff(f3(x),x)
a4 = diff(f4(x),x)
a5 = diff(f5(x),x)
a6 = diff(f6(x),x)
a7 = diff(f7(x),x)
a8 = diff(f8(x),x)


println("Computing symbolic derivative")
println("a.  ", a1)
println("b.  ", a2)
println("c.  ", a3)
println("d.  ", a4)
println("e.  ", a5)
println("f.  ", simplify(a6))
println("g.  ", simplify(a7))
println("h.  ", simplify(a8))
