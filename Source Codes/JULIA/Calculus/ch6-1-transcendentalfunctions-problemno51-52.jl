using SymPy
@syms x

v1(x) = sec(x)*csc(x)
v2(x) = cos(x)/(1 + sin(x))

V1 = integrate((v1(x)), (x, pi/4, pi/3))
V2 = integrate((v2(x)), (x))

println("Computing symbolic integral and definite integral")
println("a.  ", V1)
println("b.  ", V2)