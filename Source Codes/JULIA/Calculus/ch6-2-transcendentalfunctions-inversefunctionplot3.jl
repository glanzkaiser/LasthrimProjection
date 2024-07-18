# https://jverzani.github.io/CalculusWithJuliaNotes.jl/precalc/inversefunctions.html#lines
using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 2^x
xs = range(0, 2, length=50)
ys = f.(xs)
plot(xs, ys, color=:blue, label="f")
plot!(ys, xs, color=:red, label="f⁻¹") # the inverse