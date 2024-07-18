using SymPy, LaTeXStrings,Plots,PrettyTables
@syms a,g,v0,y0,v∞,t,c
@syms v()
@syms y()

println("First-Order Linear Differential Equations with Julia")
println("Mary bailed out of her plane at an altitude of 8000 feet ")
println("Fell freely for 15 seconds, and then opened her parachute.")
println("Assuming a drag coefficient a = 0.1 for free fall")
println("and a = 1.6 with the parachute with g = 32")
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
# Initial condition v(0) = 0
ivp_vta = dsolve(diffeqv, v(t), ics = Dict(v(0) => 0))
ivp_yta = dsolve(diffeqy, y(t), ics = Dict(y(0) => y0))

println("the particular solution for velocity, v(0) = 0:  ")
sympy.pretty_print(ivp_vta)

println("the particular solution for altitude, y(0) = y0:  ")
sympy.pretty_print(ivp_yta)

println("")
vt1 = ivp_vta(g => 32, a => 0.1)
yt1 = ivp_yta(g => 32, a => 0.1, y0 => 8000, v0 => 0)
ytp = ivp_yta(g => 32, a => 1.6, y0 => 5685, v0 => -248)
ytp_sol = rhs(ytp)
tland = solve(ytp_sol~0,t)
ytp_plot = -20*(t-15) + 5542.5 + 142.5*exp(-1.6*(t-15))

println("Substituting values of g and a:")
println("Before opening the parachute (y0 = 8000, v0 = 0, a = 0.1)")
sympy.pretty_print(vt1)
sympy.pretty_print(yt1)
println("")
println("After opening the parachute (y0 = 5685, v0 = -248, a = 1.6)")
sympy.pretty_print(ytp)
println("")

println("The velocity at 15 seconds:")
println("v(15) = ", rhs(vt1(15)))
println("")
println("The height at 15 seconds:")
println("y(15) = ", rhs(yt1(15)))
println("")
println("When did Mary land:")
println("T + 15 = ", tland[1]," + 15 = ", tland[1]+15)
println("")

#=

plot(yt1,0,15.1,label=L"y(t), \ a=0.1") # Part a
plot!(ytp_plot,15,278,label=L"y(t), \ a=1.6") 


=#