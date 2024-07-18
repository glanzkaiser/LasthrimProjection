using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(-10, stop=10, length=60)
Y = range(-10, stop=10, length=60)
# make the solution in terms of f(t,y) = c
# write the f(t,y) / f(x,y) here
f(x, y) = y/(exp(0.1*x^2))

contour!(X, Y, f, color = :blue, linewidth=2)

# perform implicit differentiation to find dy/dx
# 1. Assume y is a function of x, locally
# 2. Differentiate both sides
# 3. Solve the result for dy/dx
# see ch2-1-implicitdifferentiationfinddydx.jl
# put the result here
dydx(x,y) = Point2f(1, 0.2*x*y )

streamplot!(dydx, -10.0..10.0, -10.0..10.0, colormap=:summer) # colormap = :magma

fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/directionfield.svg",fig)