using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = 2^(-x)
g(x) = f'(x)
h(x) = g'(x)

plot(f,-3,10; color=:blue, xlims=(-3,10), xtick=-3:1:10, ylims=(-1,5), 
	framestyle=:zerolines, label=L"y = f(x) =2^{-x})",
	top_margin=10mm, legend=:topright)
plot!(g,-3,10, label=L"f'(x)")
plot!(h,-3,10, label=L"f''(x)")

