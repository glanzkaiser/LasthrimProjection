using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = log(x)

plot(f,0,5, xtick=0:1:4, xlims=(0,6), ylims=(-3,3), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \ln \ x", legend=:topright)
