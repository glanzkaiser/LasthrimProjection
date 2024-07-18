using SymPy
@syms x

# To put the terms over a common denominator, use the together function 
# The apart function does the reverse, 
# creating a partial fraction decomposition from a ratio of polynomials:

v7(x) = (x^2)/(x-1)
v8(x) = (x^2 + x)/(2x - 1)
v9(x) = (x^4)/(x + 4)
v10(x) = (x^3 + x^2)/(x + 2)

V7 = apart(v7(x))
V8 = apart(v8(x))
V9 = apart(v9(x))
V10 = apart(v10(x))

println("Computing partial fraction decomposition")
println("g.  ", V7)
println("h.  ", V8)
println("i.  ", V9)
println("j.  ", V10)