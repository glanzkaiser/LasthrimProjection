using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

y0 = 100
k = 0.00018
L = 1000

f(x) = (L*y0)/(y0+(L-y0)*exp(-L*k*x))

plot(f, xlims=(0,80),ylims=(0,1400),
	label=L"y = \frac{L y_{0}}{y_{0} + (L-y_{0}) e^{-Lkt}}", 
	left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topright)
