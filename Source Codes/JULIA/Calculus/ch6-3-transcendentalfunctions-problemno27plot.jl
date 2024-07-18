using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = x*exp(-x)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-3,10; color=:blue, xlims=(-3,10), xtick=-3:1:10, ylims=(-5,10), 
	framestyle=:zerolines, label=L"y = f(x) = x \ e^{-x}",
	top_margin=10mm, legend=:bottomright)
plot!(g,-3,10, label=L"f'(x)")
plot!(h,-3,10, label=L"f''(x)")

# Interval notation
plot!([-1,5],[7,7], label="", linecolor=:black)
plot!([-1,5],[9,9], label="", linecolor=:black)
plot!([1,1],[0,6.8], label="", linecolor=:black, linestyle=:dot)
plot!([2,2],[0,8.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(1.1,7, (L"|", 10, :black))])
annotate!([(1,7.7, (L"0", 10, :black))])
annotate!([(5.5,7.7, (L"f'", 10, :black))])
annotate!([(3,7.7, (L"-", 10, :black))])
annotate!([(0.3,7.7, (L"+", 10, :black))])

annotate!([(2.1,9, (L"|", 10, :black))])
annotate!([(2,9.7, (L"0", 10, :black))])
annotate!([(1,9.7, (L"-", 10, :black))])
annotate!([(3,9.7, (L"+", 10, :black))])
annotate!([(5.5,9.7, (L"f''", 10, :black))])
