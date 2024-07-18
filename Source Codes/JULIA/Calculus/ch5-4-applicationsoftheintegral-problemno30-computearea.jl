using SymPy

# The curve is given parametrically by x = f(t) and y = g(t)
t = symbols("t")
r = symbols("r", nonnegative=True)

fx(t) = r*cos(t)
fy(t) = r*sin(t)

# simplify(diff(fy(t),t))
# we cannot use diff inside the fy(t) since QuadGK can't comprehend diff
fxd(t) = -r*sin(t)
fyd(t) = r*cos(t)
g(t) = sqrt((fxd(t))^2 + (fyd(t))^2)

h(t) = fy(t)*g(t)

d = integrate(2PI*simplify(h(t)), (t, 0, PI))

println("Area = ", d)
