# It generates a 4 MB of image
using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(-2, stop=2, length=50)
Y = range(-2, stop=2, length=50)
f(x, y) = -x^3 + 3y - y^3

contour!(X, Y, f, color = :blue, linewidth=2)

dydx(x,y) = Point2f(1, x^2/(1 - y^2))

streamplot!(dydx, -2.0..2.0, -2.0..2.0, colormap=:blues)

fig

save("/home/browni/LasthrimProjection/JupyterLab/DifferentialEquations/example.svg",fig)