using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = x^2
g(x) = 2^x
h(x) = x^x

plot(f,-5,6; color=:blue, xlims=(-5,6), xtick=-5:1:6,ylims=(0,12), 
	framestyle=:zerolines, label=L"y = x^{2}",
	top_margin=1mm, legend=:topright)

plot!(g,-5,6; color=:green, xlims=(-5,6), xtick=-5:1:6,ylims=(0,12), 
	framestyle=:zerolines, label=L"y = 2^{x}",
	top_margin=1mm, legend=:topright)

plot!(h,-5,6; color=:red, xlims=(-5,6), xtick=-5:1:6,ylims=(0,12), 
	framestyle=:zerolines, label=L"y = x^{x}",
	top_margin=1mm, legend=:topright)
