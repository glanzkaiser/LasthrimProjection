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

plot(xs, ys, color=:black, xtick=false, ytick=false,
	xlims=(0,15), ylims=(0,20), label=L"y(x)",
	left_margin=10mm)
plot!(xs, zs, color=:blue, label=L"y = y_{0} + y'(x_{0})(x-x_{0})") # the tangent line

scatter!([5], [f(5)], color = "red1", label="", markersize = 3)
scatter!([10], [tl(10)], color = "red1", label="", markersize = 3)

plot!([0,10],[tl(10),tl(10)], linestyle=:dot, color=:green, label="")
plot!([10,10],[0,tl(10)], linestyle=:dot, color=:green, label="")
plot!([0,10],[f(10),f(10)], linestyle=:dot, color=:green, label="")
plot!([10,10],[0,f(10)], linestyle=:dot, color=:green, label="")
plot!([5,0],[tl(5),tl(5)], linestyle=:dot, color=:green, label="")
plot!([5,5],[tl(5),0], linestyle=:dot, color=:green, label="")

annotate!([(5.5,3.7, (L"(x_{0},y_{0})", 7, :black))])
annotate!([(5,-0.4, (L"x_{0}", 7, :black))])
annotate!([(10,-0.4, (L"x_{1}", 7, :black))])
annotate!([(-0.4,f(10), (L"y(x_{1})", 7, :black))])
annotate!([(-0.4,tl(10), (L"y_{1}", 7, :black))])
annotate!([(-0.4,tl(5), (L"y_{0}", 7, :black))])