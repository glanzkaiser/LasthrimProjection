using SymPy, LaTeXStrings,Plots
@syms a,g,v0,y0,v∞,t,c
@syms v()
@syms y()

println("First-Order Linear Differential Equations with Julia")
println("A ball is thrown straight up from ground level ")
println("with an initial velocity v0 = 120 feet per second")
println("Assuming a drag coefficient a = 0.05")
println("and g = 32 feet per second per second")
println("")

p1(t) = a*t^0
g1(t) = -g
μ1(t) = exp(integrate(p1(t),t))
y1(t) = (1/μ1(t))*( integrate((μ1(t)*g1(t)),t) + c)

println("The general solution for velocity :  ")
sympy.pretty_print(y1(t))
println("")

v∞ = -g/a
p2(t) = -(v0 + g/a)*exp(-a*t)
g2(t) = -g/a
μ2(t) = exp(integrate(p2(t),t))
y2(t) = (1/μ2(t))*( integrate((μ2(t)*g2(t)),t) + c)

println("The general solution for altitude :  ")
sympy.pretty_print(y2(t))
println("")

# Computing IVP with SymPy
diffeqv = Eq(v(t).diff(t) + (a)*v(t), g1(t)); string(diffeqv)
diffeqy = Eq(y(t).diff(t) - (v0 + g/a)*exp(-a*t), g2(t)); string(diffeqy)

# To solve the Initial Value Problem,
# Initial condition v(0) = -g/a
ivp_vta = dsolve(diffeqv, v(t), ics = Dict(v(0) => 120))
ivp_yta = dsolve(diffeqy, y(t), ics = Dict(y(0) => y0))

println("the particular solution for velocity, v(0) = 120:  ")
sympy.pretty_print(ivp_vta)

println("the particular solution for altitude, y(0) = y0:  ")
sympy.pretty_print(ivp_yta)

println("")

yt1 = ivp_yta(g => 32, a => 0.05, y0 => 0, v0 => 120)

println("Substituting values of g and a:")
sympy.pretty_print(yt1)
println("")

println("a. The maximum altitude:")

vt1 = ivp_vta(g => 32, a => 0.05)
sol_vt = rhs(vt1)
vsol = solve(sol_vt~0,t)


tmax = vsol[1]
println("Occurs at time t = ", vsol[1])
println("zero velocity at that time:")
sympy.pretty_print(vt1(vsol[1]))
println("")
println("Thus, the maximum altitude:")
sympy.pretty_print(yt1(tmax))

println("")
#=

plot(yt1,0,7.1,label=L"y(t), \ a=0.05") # Part a
plot(vt1,0,7.1,label=L"v(t), \ a=0.05") # Part a


=#