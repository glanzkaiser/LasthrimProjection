using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(-5, stop=5, length=60)
Y = range(-5, stop=5, length=60)
# make the solution in terms of f(t,y) = c
# write the f(t,y) here
f(x, y) = y^2-2y-x^3-2x^2-2x

contour!(X, Y, f, color = :blue, linewidth=2)

# perform implicit differentiation to find dy/dx
# 1. Assume y is a function of x, locally
# 2. Differentiate both sides
# 3. Solve the result for dy/dx
# see ch2-1-implicitdifferentiationfinddydx.jl
# put the result here
dydx(x,y) = Point2f(1, (3*x^2 + 4*x + 2)/(2*(y - 1)) )

streamplot!(dydx, -5.0..5.0, -5.0..5.0, colormap=:summer) # colormap = :magma

fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/directionfield.svg",fig)