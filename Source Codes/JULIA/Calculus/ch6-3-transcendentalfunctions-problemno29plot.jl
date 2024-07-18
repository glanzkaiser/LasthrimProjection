using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = log(x^2 + 1)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-6,6; color=:blue, xlims=(-6,6), xtick=-6:1:6, yaxis=false,ylims=(-3,10), 
	framestyle=:zerolines, label=L"y = f(x) = \ln (x^{2} + 1)",
	top_margin=10mm, legend=:bottomright)
plot!(g,-6,6, label=L"f'(x)")
plot!(h,-6,6, label=L"f''(x)")

# Interval notation
plot!([-3,4],[7,7], label="", linecolor=:black)
plot!([-3,4],[9,9], label="", linecolor=:black)
plot!([-1,-1],[0,8.8], label="", linecolor=:black, linestyle=:dot)
plot!([1,1],[0,8.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(0.1,7, (L"|", 10, :black))])
annotate!([(0,7.7, (L"0", 10, :black))])
annotate!([(4.5,7.7, (L"f'", 10, :black))])
annotate!([(-1.3,7.7, (L"-", 10, :black))])
annotate!([(1.3,7.7, (L"+", 10, :black))])

annotate!([(-0.9,9, (L"|", 10, :black))])
annotate!([(1.1,9, (L"|", 10, :black))])
annotate!([(-1,9.7, (L"0", 10, :black))])
annotate!([(1,9.7, (L"0", 10, :black))])
annotate!([(-2,9.7, (L"-", 10, :black))])
annotate!([(0.3,9.7, (L"+", 10, :black))])
annotate!([(1.7,9.7, (L"-", 10, :black))])
annotate!([(4.5,9.7, (L"f''", 10, :black))])
