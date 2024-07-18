using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = exp(-(x - 2)^2)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-2,6; color=:blue, xlims=(-2,6), xtick=-2:1:6, yaxis=false,ylims=(-3,10), 
	framestyle=:zerolines, label=L"y = f(x) = e^{-(x-2)^{2}}",
	top_margin=10mm, legend=:bottomright)
plot!(g,-2,6, label=L"f'(x)")
plot!(h,-2,6, label=L"f''(x)")

# Interval notation
plot!([-1,4],[7,7], label="", linecolor=:black)
plot!([-1,4],[9,9], label="", linecolor=:black)
plot!([1.293,1.293],[0,8.8], label="", linecolor=:black, linestyle=:dot)
plot!([2.707,2.707],[0,8.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(2,7, (L"|", 10, :black))])
annotate!([(2,7.73, (L"0", 10, :black))])
annotate!([(4.5,7.7, (L"f'", 10, :black))])
annotate!([(0.3,7.7, (L"+", 10, :black))])
annotate!([(3.3,7.7, (L"-", 10, :black))])

annotate!([(1.293,9, (L"|", 10, :black))])
annotate!([(2.707,9, (L"|", 10, :black))])
annotate!([(1.293,9.73, (L"0", 10, :black))])
annotate!([(2.707,9.73, (L"0", 10, :black))])
annotate!([(0,9.7, (L"+", 10, :black))])
annotate!([(2,9.7, (L"-", 10, :black))])
annotate!([(3.7,9.7, (L"+", 10, :black))])
annotate!([(4.5,9.7, (L"f''", 10, :black))])
