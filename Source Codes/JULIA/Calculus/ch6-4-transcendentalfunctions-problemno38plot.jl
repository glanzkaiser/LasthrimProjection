using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = x*log(x^2 + 1)/log(3)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-6,6; color=:blue, xlims=(-6,6), xtick=-6:1:6, ylims=(-4,8), 
	label=L"y = f(x) = x \log_{3} (x^{2} + 1)",
	top_margin=10mm, legend=:bottomleft)
plot!(g,-6,6, label=L"f'(x)")
plot!(h,-6,6, label=L"f''(x)")

# Interval notation
plot!([-2,4],[5,5], label="", linecolor=:black)
plot!([-2,4],[7,7], label="", linecolor=:black)
plot!([0,0],[-4,4.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(0.08,5, (L"|", 10, :black))])
annotate!([(0,5.7, (L"0", 10, :black))])
annotate!([(4.5,5.7, (L"f'", 10, :black))])
annotate!([(-1,5.7, (L"+", 10, :black))])
annotate!([(2,5.7, (L"+", 10, :black))])

annotate!([(0,7, (L"|", 10, :black))])
annotate!([(0,7.73, (L"0", 10, :black))])
annotate!([(-2,7.7, (L"-", 10, :black))])
annotate!([(2.3,7.7, (L"+", 10, :black))])
annotate!([(4.5,7.7, (L"f''", 10, :black))])