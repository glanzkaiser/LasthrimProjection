using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = log(x)/log(1/3)
g(x) = log(x)/log(3)
h(x) = g'(x)

plot(f,-6,6; color=:blue, xlims=(-6,6), xtick=-6:1:6, ylims=(-4,8), 
	label=L"y = \log_{1/3} (x)", framestyle=:zerolines,
	top_margin=10mm, legend=:bottomleft)
plot!(g,-6,6, label=L"y = \log_{3} (x)")
