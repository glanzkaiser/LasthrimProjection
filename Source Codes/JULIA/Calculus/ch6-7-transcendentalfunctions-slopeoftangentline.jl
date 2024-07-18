# https://jverzani.github.io/CalculusWithJuliaNotes.jl/precalc/inversefunctions.html#lines
using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia, SymPy # ignore any warnings 
gr()

@syms x
f(x) = exp(0.2x) + 2

c = 4
# tangent line formula y-y1 = m(x-x1) 
# x1 = c, y1 = f(c), at this plot the tangent line went through point (4,f(4))
# you can use f'(4) or fd(4)
tl(x) = f(c) + f'(4) * (x - c)
xs = range(0, 23, length=150)
ys = f.(xs)
zs = tl.(xs)

plot(xs, ys, color=:blue, xlims=(0,25), ylims=(0,25), legend=false)
plot!(xs, zs, color=:blue) # the tangent line

scatter!([4], [f(4)], color = "red1", label="", markersize = 3)

annotate!([(4.1,2.8, (L"(x_{0},y_{0})", 7, :black))])
