using SymPy, QuadGK

# The curve is given parametrically by x = f(t) and y = g(t)
t = symbols("t")

fx(t) = 1 - t^2
fy(t) = 2t

# simplify(diff(fx(t),t))
# simplify(diff(fy(t),t))
# we cannot use diff inside the fy(t) since QuadGK can't comprehend diff
fxd(t) = -2t
fyd(t) = 2
g(t) = sqrt((fxd(t))^2 + (fyd(t))^2)

h(t) = fy(t)*g(t)
Area(x) = 2pi*h(x)

d = quadgk(t -> Area(t), 0, 1, rtol=1e-10)
println("(Area, error) = ", d)
