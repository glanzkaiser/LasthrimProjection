using SymPy, LaTeXStrings,Plots
@syms t,c
@syms i()

println("First-Order Linear Differential Equations with Julia")
println("A closed circuit with R = 10^6 ohm and L = 1 H with battplotery of 1 V")
println("Find I as function of time when the switch is closed")
println("")

p(t) = 10^6*(t^0)
g(t) = t^0
μ(t) = exp(integrate(p(t),t))
y(t) = (1/μ(t))*( integrate((μ(t)*g(t)),t) + c)

println("The general solution:  ")
sympy.pretty_print(y(t))
println("")

# Computing IVP with SymPy
diffeqi = Eq(i(t).diff(t) + (10^6)*i(t), g(t)); string(diffeqi)

# To solve the Initial Value Problem, initial condition I(0) = 0
ivp_it = dsolve(diffeqi, i(t), ics = Dict(i(0) => 0 ))
println("the particular solution:  ")
sympy.pretty_print(ivp_it)

#=
plot(ivp_it,0,10,ylims=(8*10^-7,10^-6), label=L"I(t)")

=#