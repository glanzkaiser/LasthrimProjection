using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = x*2^(-x)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-3,10; color=:blue, xlims=(-3,10), xtick=-3:1:10, ylims=(-3,8), 
	framestyle=:zerolines, label=L"y = f(x) =x 2^{-x}",
	top_margin=10mm, legend=:topright)
plot!(g,-3,10, label=L"f'(x)")
plot!(h,-3,10, label=L"f''(x)")

# Interval notation
plot!([-2,4],[5,5], label="", linecolor=:black)
plot!([-2,4],[7,7], label="", linecolor=:black)
plot!([1/log(2),1/log(2)],[0,4.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(1/log(2)+0.08,5, (L"|", 10, :black))])
annotate!([(1/log(2),5.7, (L"0", 10, :black))])
annotate!([(4.5,5.7, (L"f'", 10, :black))])
annotate!([(-1,5.7, (L"+", 10, :black))])
annotate!([(3,5.7, (L"-", 10, :black))])

annotate!([(2/log(2),7, (L"|", 10, :black))])
annotate!([(2/log(2),7.73, (L"0", 10, :black))])
annotate!([(-1,7.7, (L"-", 10, :black))])
annotate!([(3.3,7.7, (L"+", 10, :black))])
annotate!([(4.5,7.7, (L"f''", 10, :black))])