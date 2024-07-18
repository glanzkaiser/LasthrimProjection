using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = exp(x) + x
g(x) = f'(x)
h(x) = g'(x)

plot(f,-5,5; color=:blue, xlims=(-5,5), xtick=-5:1:5, ylims=(-5,5), 
	framestyle=:zerolines, label=L"y = f(x) = e^{x} + x",
	top_margin=10mm, legend=:bottomright)
plot!(g,-3,10, label=L"f'(x)")
plot!(h,-3,10, label=L"f''(x)")

