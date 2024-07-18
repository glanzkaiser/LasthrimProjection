using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = atan(x)-1
g(x) = f'(x)
h(x) = g'(x)

plot(f,-6,6; color=:blue, xlims=(-6,6), xtick=-6:1:6, ylims=(-6,8), 
	label=L"y = f(x) = \int_{1}^{x} 2^{-t^{2}} \ dt",
	top_margin=10mm, legend=:bottomright)
plot!(g,-6,6, label=L"f'(x)")
plot!(h,-6,6, label=L"f''(x)")

# Interval notation
plot!([-2,4],[5,5], label="", linecolor=:black)
plot!([-2,4],[7,7], label="", linecolor=:black)
plot!([0,0],[-6,4.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(4.5,5.7, (L"f'", 10, :black))])
annotate!([(-1,5.7, (L"+", 10, :black))])
annotate!([(2,5.7, (L"+", 10, :black))])

annotate!([(0,7, (L"|", 10, :black))])
annotate!([(0,7.73, (L"0", 10, :black))])
annotate!([(-1,7.7, (L"+", 10, :black))])
annotate!([(2,7.7, (L"-", 10, :black))])
annotate!([(4.5,7.7, (L"f''", 10, :black))])