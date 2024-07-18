# https://jverzani.github.io/CalculusWithJuliaNotes.jl/ODEs/odes.html
using SymPy, CalculusWithJulia, LaTeXStrings,Plots
@syms x
@syms y()

println("First-Order Linear Differential Equations with Julia")
println("y' = 0.2y(16-y) is the differential equation")
println("")

#  we can use diff(u(x),x) but here, for visual simplicity, use the Differential operator,
D = Differential(x)
eqn = D(y)(x) ~ 0.2 * y(x) * (16 - y(x))
out = dsolve(eqn)
# The limits are confirmed by investigating the limits of the right-hand:
limit(rhs(out), x => oo), limit(rhs(out), x => -oo)

# For the initial value problem y(0)=3
eq = rhs(out)    # just the right hand side
C1 = first(setdiff(free_symbols(eq), (x))) # fish out constant
c1 = solve(eq(x=>0) - 3, C1)
eq(C1 => c1[1])

sol = out(C1 => c1[1])

x0, y0 = 0, 3
ivp_sol = dsolve(eqn, y(x), ics=Dict(y(x0) => y0))

println("the particular solution for y(0) = 3:  ")
sympy.pretty_print(ivp_sol)