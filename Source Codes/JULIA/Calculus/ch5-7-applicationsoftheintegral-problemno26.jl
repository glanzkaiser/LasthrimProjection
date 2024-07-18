using SymPy
@syms x, k

a,b = 0, 180
k1 = solve(integrate(k*(x^2)*(180-x),(x,a,b)) ~ 1, k)

f1(x) = (1/87480000)*(x^2)*(180-x)
e1(x) = x*(1/87480000)*(x^2)*(180-x)

pdf = integrate(f1(x), (x, 100,150))
E = integrate((e1(x)), (x, 0, 180))
#pdf.evalf()
#E.evalf()

println("a. k = ", simplify(k1))
println("b. P(100 ≤ X ≤ 150) = ", simplify(pdf))
print("c. E(x) = ", simplify(E))

