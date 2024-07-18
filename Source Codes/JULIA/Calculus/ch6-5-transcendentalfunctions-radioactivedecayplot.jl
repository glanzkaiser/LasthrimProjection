using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

y0 = 100
k = -0.0018

f(x) = y0*exp(k*x)

plot(f, xlims=(0,1800),ylims=(0,200),
	label=L"y = y_{0} e^{kt}", 
	right_margin=5mm, left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topright)
