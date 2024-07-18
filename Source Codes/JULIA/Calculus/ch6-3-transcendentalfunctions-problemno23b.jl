using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = exp(-x)

plot(f,-5,3; color=:blue, xlims=(-5,5), xtick=-5:1:5, ylims=(-1,10), 
	framestyle=:zerolines, label=L"y = f(x) = e^{-x}",
	top_margin=10mm, legend=:topright)
