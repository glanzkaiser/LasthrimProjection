using SymPy, LaTeXStrings,Plots
@syms t,c
@syms x()
@syms y()

println("First-Order Linear Differential Equations with Julia")
println("Tank 1 initially contains 100 gallons of solution, with 50 pounds of dissolved salt")
println("Tank 2 initially contains 200 gallons of solution, with 150 pounds of dissolved salt")
println("Pure water flows into tank 1 at 2 gallons per minute")
println("The well-mixed solution flows out and into tank 2 at the same rate")
println("The solution in tank 2 drains away at the same rate")
println("")

p1(t) = (2/100)t^0
g1(t) = 0
μ1(t) = exp(integrate(p1(t),t))
y1(t) = (1/μ1(t))*( integrate((μ1(t)*g1(t)),t) + c)

p2(t) = (1/100)t^0
g2(t) = exp(-t/50)
μ2(t) = exp(integrate(p2(t),t))
y2(t) = (1/μ2(t))*( integrate((μ2(t)*g2(t)),t) + c)

println("The general solution for tank 1:  ")
sympy.pretty_print(y1(t))
println("")

println("The general solution for tank 2:  ")
sympy.pretty_print(y2(t))
println("")

# Computing IVP with SymPy
diffeqx = Eq(x(t).diff(t) + (2/100)*x(t), g1(t)); string(diffeqx)
diffeqy = Eq(y(t).diff(t) + (1/100)*y(t), g2(t)); string(diffeqy)

# To solve the Initial Value Problem,
# Tank 1 initial condition x(0) = 50
# Tank 2 initial condition y(0) = 150
ivp_xt = dsolve(diffeqx, x(t), ics = Dict(x(0) => 50 ))
ivp_yt = dsolve(diffeqy, y(t), ics = Dict(y(0) => 150 ))

println("the particular solution for tank 1:  ")
sympy.pretty_print(ivp_xt)

println("the particular solution for tank 2:  ")
sympy.pretty_print(ivp_yt)

#=
plot(ivp_xt,0,600,label=L"x(t)")
plot!(ivp_yt,0,600,label=L"y(t)")
=#