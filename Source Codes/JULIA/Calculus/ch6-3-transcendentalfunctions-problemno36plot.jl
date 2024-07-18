using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()
@syms t
# integrate(t*exp(-t),0,x)
f(x) = (-x-1)*exp(-x)+1
g(x) = f'(x)
h(x) = g'(x)

plot(f,-3,9; color=:blue, xlims=(-3,10), xtick=-3:1:10, yaxis=false,ylims=(-2,8), 
	framestyle=:zerolines, label=L"y = f(x) = \int_{0}^{x} e^{-t^{2}}",
	top_margin=10mm, legend=:topright)
plot!(g,-3,9, label=L"f'(x)")
plot!(h,-3,9, label=L"f''(x)")

# Interval notation
plot!([-3,4],[5,5], label="", linecolor=:black)
plot!([-3,4],[7,7], label="", linecolor=:black)
plot!([1,1],[0,6.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(0,5, (L"|", 10, :black))])
annotate!([(0,5.7, (L"0", 10, :black))])
annotate!([(4.5,5.7, (L"f'", 10, :black))])
annotate!([(-1.3,5.7, (L"+", 10, :black))])
annotate!([(1.3,5.7, (L"-", 10, :black))])

annotate!([(1.051,7, (L"|", 10, :black))])
annotate!([(1,7.73, (L"0", 10, :black))])
annotate!([(-1,7.7, (L"+", 10, :black))])
annotate!([(2.7,7.7, (L"-", 10, :black))])
annotate!([(4.5,7.7, (L"f''", 10, :black))])
