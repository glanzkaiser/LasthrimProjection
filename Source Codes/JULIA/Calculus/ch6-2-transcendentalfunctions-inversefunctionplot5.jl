# https://jverzani.github.io/CalculusWithJuliaNotes.jl/precalc/inversefunctions.html#lines
using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia, SymPy # ignore any warnings 
gr()

@syms x
f(x) = log(0.2x) + sin(0.01x^2)
#fd = diff(f(x),x)
fd(x) = 0.02x*cos(0.01x^2) + 1/x
c = 4
# tangent line formula y-y1 = m(x-x1) 
# x1 = c, y1 = f(c), at this plot the tangent line went through point (4,f(4))
# you can use f'(4) or fd(4)
tl(x) = f(c) + f'(4) * (x - c)
xs = range(0, 23, length=150)
ys = f.(xs)
zs = tl.(xs)

plot(xs, ys,  color=:blue, xlims=(-5,25), ylims=(-5,25), legend=false)
plot!(xs, zs, color=:blue) # the tangent line
plot!(ys, xs, color=:red)  # the inverse function
plot!(zs, xs, color=:red)  # inverse of tangent line
plot!(identity, color=:green, linestyle=:dash)

scatter!([4], [f(4)], color = "red1", label="", markersize = 3)
scatter!([f(4)], [4], color = "red1", label="", markersize = 3)

annotate!([(-1.1,4.5, (L"(d,c)", 7, :black))])
annotate!([(4.1,-1.6, (L"(c,d)", 7, :black))])
annotate!([(0.5,-3.7, (L"l_{1}", 7, :black))])
annotate!([(-3.4,0.8, (L"l_{2}", 7, :black))])