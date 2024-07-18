using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(-8, stop=8, length=60)
# Y = range(0, stop=30, length=60)
# y' =  x^3/y^2
# Draw the particular solution that satisfies the initial condition y(0)=1

# perform implicit differentiation to find dy/dx
# put the result here
dydx(x,y) = Point2f(1, 0.2*y*(16-y) )

streamplot!(dydx, -10.0..10.0, -10.0..10.0, colormap=:summer) # colormap = :magma
g(x) =  cbrt(((3x^4)/4)/(4) + 1)
lines!(X, g,  linecolor=:blue, linewidth=2)
fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/directionfield1.png",fig)

println("The differential equation: y' = x-y+2")
println("Initial condition: y(0) = 4")
println("")
println("Exact solution:")

using SymPy, CalculusWithJulia
@syms x,y, u()

F(y,x) = (x^3)/(y^2)
x0,y0 = 0,1

# To calculate the analytic solution
D = Differential(x)
dsolve(D(u)(x) - F(u(x), x))
out = dsolve(D(u)(x) - F(u(x),x), u(x), ics=Dict(u(x0) => y0))
sympy.pretty_print(rhs(out))
