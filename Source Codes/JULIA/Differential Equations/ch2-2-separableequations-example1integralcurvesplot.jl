using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(-4, stop=4, length=50)
Y = range(-4, stop=4, length=50)
# make the solution in terms of f(t,y) = c
# write the f(t,y) here
f(x, y) = -x^3 + 3y - y^3

contour!(X, Y, f, color = :blue, linewidth=2)

# perform implicit differentiation to find dy/dx
# 1. Assume y is a function of x, locally
# 2. Differentiate both sides
# 3. Solve the result for dy/dx
# see ch2-1-implicitdifferentiationfinddydx.jl
# put the result here
dydx(x,y) = Point2f(1, -x^2/(y^2 - 1))

streamplot!(dydx, -4.0..4.0, -4.0..4.0, colormap=:summer) # colormap = :magma

fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/directionfield.svg",fig)