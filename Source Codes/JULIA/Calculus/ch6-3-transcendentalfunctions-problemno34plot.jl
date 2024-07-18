using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = exp(x) - exp(-x)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-5,6; color=:blue, xlims=(-5,6), xtick=-5:1:6, yaxis=false,ylims=(-8,10), 
	framestyle=:zerolines, label=L"y = f(x) = e^{x} - e^{-x}",
	top_margin=10mm, legend=:bottomright)
plot!(g,-5,6, label=L"f'(x)")
plot!(h,-5,6, label=L"f''(x)")

# Interval notation
plot!([-3,4],[7,7], label="", linecolor=:black)
plot!([-3,4],[9,9], label="", linecolor=:black)
plot!([0,0],[0,8.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(4.5,7.7, (L"f'", 10, :black))])
annotate!([(-1.3,7.7, (L"+", 10, :black))])
annotate!([(1.3,7.7, (L"+", 10, :black))])

annotate!([(0.051,9, (L"|", 10, :black))])
annotate!([(0,9.73, (L"0", 10, :black))])
annotate!([(-2,9.7, (L"-", 10, :black))])
annotate!([(1.7,9.7, (L"+", 10, :black))])
annotate!([(4.5,9.7, (L"f''", 10, :black))])
