# https://jverzani.github.io/CalculusWithJuliaNotes.jl/precalc/inversefunctions.html#lines
using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = cbrt(x)
xs = range(-2, 2, length=150)
ys = f.(xs)
plot(xs, ys, color=:blue, aspect_ratio=:equal, legend=false)
plot!(ys, xs, color=:red)
plot!(identity, color=:green, linestyle=:dash)
x, y = 1/2, f(1/2)
plot!([x,y], [y,x], color=:green, linestyle=:dot)