using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x^3
g(x) = 3^x

plot(f, xlims=(0,6),ylims=(0,60),
	label=L"y = x^{3}", left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topright)
plot!(g, xlims=(0,6),ylims=(0,60),
	label=L"y = 3^{x}",framestyle=:zerolines,
	legend=:topright)

# @syms x
# solve(x^3-3^x)