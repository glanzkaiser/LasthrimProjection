using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = x*exp(x/2)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-8,3; color=:blue, xlims=(-8,5), xtick=-8:1:5, ylims=(-2,10), 
	framestyle=:zerolines, label=L"y = f(x) = x \ \exp (x/2)",
	top_margin=10mm, legend=:bottomright)
plot!(g,-8,3, label=L"f'(x)")
plot!(h,-8,3, label=L"f''(x)")

# Interval notation
plot!([-6,2],[7,7], label="", linecolor=:black)
plot!([-6,2],[9,9], label="", linecolor=:black)
plot!([-4,-4],[0,6.8], label="", linecolor=:black, linestyle=:dot)
plot!([-2,-2],[0,8.8], label="", linecolor=:black, linestyle=:dot)

annotate!([(-3.9,7, (L"|", 10, :black))])
annotate!([(-4,7.7, (L"0", 10, :black))])
annotate!([(-6,7.7, (L"f'", 10, :black))])
annotate!([(-5,7.7, (L"-", 10, :black))])
annotate!([(-2.3,7.7, (L"+", 10, :black))])

annotate!([(-1.9,9, (L"|", 10, :black))])
annotate!([(-2,9.7, (L"0", 10, :black))])
annotate!([(-4,9.7, (L"-", 10, :black))])
annotate!([(-0.3,9.7, (L"+", 10, :black))])
annotate!([(-6,9.7, (L"f''", 10, :black))])
