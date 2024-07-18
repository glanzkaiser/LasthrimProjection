# Sinh and its inverse
using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()
@syms x

a, b = -3, 3

y1(x) = sinh(x)
y2(x) = log(x + sqrt(x^2 + 1))
y3(x) = x

xs1 = range(a, b, length=150)

plot(xs1, y1, color=:red, 
	xlims=(a,b), ylims=(-π,π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"y = \sinh \ x", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)

plot!(xs1,y2, label=L"y = \ln (x + \sqrt{x^{2} + 1})")
plot!(xs1,y3, label=L"y = x", linestyle=:dash)
