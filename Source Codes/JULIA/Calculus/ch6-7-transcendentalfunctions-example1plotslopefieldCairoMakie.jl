using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(0, stop=10, length=60)
# Y = range(0, stop=30, length=60)
# y' = 0.2y(16-y)
# Draw the particular solution that satisfies the initial condition y(0)=3

# perform implicit differentiation to find dy/dx
# put the result here
dydx(x,y) = Point2f(1, 0.2*y*(16-y) )

streamplot!(dydx, 0..10.0, 0..30.0, colormap=:summer) # colormap = :magma
g(x) =  16 - 13*exp(-0.2x)
lines!(X, g,  linecolor=:blue, linewidth=2)
fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/directionfield1.png",fig)