# https://discourse.julialang.org/t/sympy-computation-with-dsolve-for-logistic-differential-equation/104338/3

using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms K, L, y(), t, y0

∂ = Differential(t)
yt_sym = dsolve(∂(y(t)) ~ K*y(t)*(L - y(t)), ics=Dict(y(0) => y0)) # equation of t; K, y0, L

println("Logistic Differential Equation with Julia")
println("The solution")
sympy.pretty_print(yt_sym)

