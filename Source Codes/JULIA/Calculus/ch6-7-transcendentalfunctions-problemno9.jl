# https://jverzani.github.io/CalculusWithJuliaNotes.jl/ODEs/euler.html
using SymPy, CalculusWithJulia, LaTeXStrings,Plots,PrettyTables
@syms x,y, u()

F(y,x) = x-y+2
x0,y0 = 0,4

println("The differential equation: y' = x-y+2")
println("Initial condition: y(0) = 4")
println("interval [0,1]")
println("")
println("Exact solution:")

# To calculate the analytic solution
D = Differential(x)
dsolve(D(u)(x) - F(u(x), x))
out = dsolve(D(u)(x) - F(u(x),x), u(x), ics=Dict(u(x0) => y0))
sympy.pretty_print(rhs(out))

# To plot
p = plot(legend=:bottomright)
vectorfieldplot!((x,y) -> [1, F(x,y)], xlims=(0, 5), ylims=(0, 6))
plot!(rhs(out), linecolor=:green, linewidth=2, label=L"y(x) = x + 1 + 3e^{-x}")
