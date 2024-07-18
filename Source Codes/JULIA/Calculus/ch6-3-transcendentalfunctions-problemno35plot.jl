using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()
@syms t
# integrate(exp(-t^2),0,x)
f(x) = sqrt(pi)*erf(x)/2
g(x) = f'(x)
h(x) = g'(x)

plot(f,-5,6; color=:blue, xlims=(-5,6), xtick=-5:1:6, yaxis=false,ylims=(-3,8), 
	framestyle=:zerolines, label=L"y = f(x) = \int_{0}^{x} e^{-t^{2}}",
	top_margin=10mm, legend=:bottomright)
plot!(g,-5,6, label=L"f'(x)")
plot!(h,-5,6, label=L"f''(x)")

# Interval notation
plot!([-3,4],[5,5], label="", linecolor=:black)
plot!([-3,4],[7,7], label="", linecolor=:black)
plot!([0,0],[0,6.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(4.5,5.7, (L"f'", 10, :black))])
annotate!([(-1.3,5.7, (L"+", 10, :black))])
annotate!([(1.3,5.7, (L"+", 10, :black))])

annotate!([(0.051,7, (L"|", 10, :black))])
annotate!([(0,7.73, (L"0", 10, :black))])
annotate!([(-2,7.7, (L"+", 10, :black))])
annotate!([(1.7,7.7, (L"-", 10, :black))])
annotate!([(4.5,7.7, (L"f''", 10, :black))])
