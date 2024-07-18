# Catenary example
using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()
@syms x

a, b = -6π, 6π

y(x) = 10cosh(x/10)

xs1 = range(a, b, length=150)

plot(xs1, y, color=:red, 
	xlims=(-π,6π), ylims=(-π,6π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"y = a \ \cosh \frac{x}{a}", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)

plot!([1,1],[9.7,7.7], label="", arrow=true, linecolor=:green)
plot!([2,2],[9.8,7.8], label="", arrow=true, linecolor=:green)
plot!([3,3],[10,8], label="", arrow=true, linecolor=:green)
plot!([4,4],[10.3,8.3], label="", arrow=true, linecolor=:green)

scatter!([8], [y(8)], color = "blue1", label="", markersize = 4)
plot!([8,12],[y(8),y(8)], label="", arrow=true, linecolor=:green)
plot!([12,12],[y(8),y(12)], label="", arrow=true, linecolor=:green)

annotate!([(9,13.8, (L"\phi", 10, :black))])
annotate!([(0.4,10.8, (L"A", 10, :black))])
annotate!([(-1.4,10.8, (L"H", 10, :black))])
annotate!([(8,14, (L"P", 10, :black))])
annotate!([(10,16, (L"T", 10, :black))])
annotate!([(10,12.7, (L"T \ \cos \ \phi", 10, :black))])
annotate!([(13,15, (L"T \ \sin \ \phi", 10, :black))])