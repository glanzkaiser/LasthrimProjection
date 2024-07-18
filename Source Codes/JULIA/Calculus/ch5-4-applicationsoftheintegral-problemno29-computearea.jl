using SymPy

x = symbols("x")
r = symbols("r", nonnegative=True)
# check by typing r.is_nonnegative

f(x) = sqrt(r^2 - x^2)
# simplify(diff(f(x),x))
# we cannot use diff inside the fd(x) since QuadGK can't comprehend diff
fd(x) = -x/(sqrt(r^2 - x^2))
g(x) = sqrt(1 + (fd(x))^2)

h(x) = f(x)*g(x)

d = integrate(2PI*simplify(h(x)), (x, -r, r))

println("Area = ", d)