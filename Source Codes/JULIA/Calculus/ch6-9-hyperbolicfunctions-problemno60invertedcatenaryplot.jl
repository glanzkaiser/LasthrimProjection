# Inverted Catenary example
using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()
@syms x

a, b = -150π, 150π

y(x) = 758 - 128cosh(x/128)

xs1 = range(a, b, length=150)

plot(xs1, y, color=:red, 
	xlims=(a,b), ylims=(-π,210π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"y = 758 - 128 \ \cosh \frac{x}{128}", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)
