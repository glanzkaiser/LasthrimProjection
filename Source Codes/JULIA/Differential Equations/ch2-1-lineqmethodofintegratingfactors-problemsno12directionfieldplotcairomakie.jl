using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(-3, stop=10, length=50)
Y = range(-2, stop=5, length=50)
# make the solution in terms of f(t,y) = c
# write the f(t,y) here
f(x, y) = (y - 3x^2 + 12x - 24)*exp(x/2)

#contour!(X, Y, f, color = :blue, linewidth=2)

# perform implicit differentiation to find dy/dx
# 1. Assume y is a function of x, locally
# 2. Differentiate both sides
# 3. Solve the result for dy/dx
# see ch2-1-implicitdifferentiationfinddydx.jl
# put the result here
dydx(x,y) = Point2f(1, (3*x^2/2 - y/2))

streamplot!(dydx, -3.0..10.0, -2.0..5.0, colormap=:winter) # colormap = :magma

fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/directionfield.svg",fig)