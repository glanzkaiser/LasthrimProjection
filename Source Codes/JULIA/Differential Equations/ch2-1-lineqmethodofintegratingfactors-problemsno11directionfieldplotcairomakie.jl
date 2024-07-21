using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(0, stop=10, length=50)
Y = range(-4, stop=4, length=50)
# make the solution in terms of f(t,y) = c
# write the f(t,y) here
f(x, y) = y*exp(x) + 2exp(x)*cos(2x) - exp(x)*sin(2x)

#contour!(X, Y, f, color = :blue, linewidth=2)

# perform implicit differentiation to find dy/dx
# 1. Assume y is a function of x, locally
# 2. Differentiate both sides
# 3. Solve the result for dy/dx
# see ch2-1-implicitdifferentiationfinddydx.jl
# put the result here
dydx(x,y) = Point2f(1, (-y + 5*sin(2x)))

streamplot!(dydx, 0.0..10.0, -4.0..4.0, colormap=:winter) 
# colormap = :magma,greens,inferno,plasma,viridis,jet,cubehelix,gnuplot,autumn,winter

fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/directionfield.svg",fig)