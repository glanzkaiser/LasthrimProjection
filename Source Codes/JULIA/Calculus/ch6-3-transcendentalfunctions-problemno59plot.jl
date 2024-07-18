using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()
f(x) = log(x^2 + exp(-x))

plot(f,-20,60; color=:blue, xlims=(-20,60), xtick=-20:20:60,ylims=(-6,20), 
	framestyle=:zerolines, label=L"y = \ln (x^{2} + e^{-x} )",
	top_margin=1mm, legend=:topright)

