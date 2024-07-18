using SymPy, QuadGK

x = symbols("x")

f(x) = (x^6 + 2)/(8x^2)
# simplify(diff(f(x),x))
# we cannot use diff inside the fd(x) since QuadGK can't comprehend diff
g(x) = sqrt(1 + ((x^6 - 1)/(2x^3))^2)
#g(x) = f(x)*√(1+(fd(x))^2)

h(x) = f(x)*g(x)
Area(x) = 2pi*h(x)

d = quadgk(x -> Area(x), 1, 3, rtol=1e-10)
dq = 2π*quadgk(h, 1, 3)[1]

println("(Area, error) = ", d)

println("Area with QuadGK = ", dq)