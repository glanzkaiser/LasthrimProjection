using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = log(2x-1)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-3,10; color=:blue, xlims=(-3,10), xtick=-3:1:10, ylims=(-5,5), 
	framestyle=:zerolines, label=L"y = f(x) = \ln (2x-1)",
	top_margin=10mm, legend=:bottomright)
plot!(g,-3,10, label=L"f'(x)")
plot!(h,-3,10, label=L"f''(x)")

