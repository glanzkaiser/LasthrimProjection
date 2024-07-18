using SymPy
@syms x, k, y

a,b = 0, 200
c,d = 0, 100
k1 = solve(integrate(k*(x^2)*(200-x)^(8),(x,a,b)) ~ 1, k)

k2 = solve(integrate(k*(x^2)*(100-x)^(8),(x,c,d)) ~ 1, k)

f1(x) = k1[1]*(x^2)*(200-x)^(8)
f1(y) = k2[1]*(y^2)*(100-y)^(8)
e1(x) = x*k1[1]*(x^2)*(200-x)^(8)

pdf = integrate(f1(x), (x, 100, 200))
E = integrate((e1(x)), (x, 0, 200))
pdfs = simplify(pdf)
#pdf.evalf()
#E.evalf()

cdf = integrate(f1(x), (x,0,x))
fyy = integrate(f1(y), (y,0,y))

println("a. k = ", k1[1].evalf())
println("b. P(X ≥ 100) = ", pdfs)
println("c. E(x) = ", simplify(E))
println("d. F(x) = ", simplify(cdf))
println("e. F_{Y}(y) = ", simplify(fyy))


