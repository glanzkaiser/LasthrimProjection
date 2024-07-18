using SymPy
@syms x, k, y

a,b = 0, 0.6
k1 = solve(integrate(k*(x^6)*(0.6-x)^(8),(x,a,b)) ~ 1, k)

f1(x) = k1[1]*(x^6)*(0.6-x)^(8)
f1(y) = k1[1]*(y^6)*((3/127)-y)^(8)
e1(x) = x*k1[1]*(x^6)*(0.6-x)^(8)

pdf = integrate(f1(x), (x, 0.35,0.45))
E = integrate((e1(x)), (x, 0, 0.6))
pdfs = 1 - simplify(pdf)
#pdf.evalf()
#E.evalf()

cdf = integrate(f1(x), (x,0,x))
fyy = integrate(f1(y), (y,0,y))

println("a. k = ", k1[1])
println("b. 1 - P(0.35 ≤ X ≤ 0.45) = ", pdfs)
println("c. E(x) = ", simplify(E))
println("d. F(x) = ", simplify(cdf))
println("e. F_{Y}(y) = ", simplify(fyy))


