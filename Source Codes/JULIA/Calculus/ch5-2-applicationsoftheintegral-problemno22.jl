using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

# For the curve
f(x) = (3/16)*x^2 + 3
g(x) = (1/16)*x^2 + 5
# Plotting time

plot(f, ylims= (0,10), xlims=(0,5), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, left_margin=5mm, bottom_margin=5mm, 
	label=L"y = \frac{3}{16}x^{2} + 3", 
	size=(720, 360), tickfontsize=10)
plot!(g, ylims= (0,10), xlims=(0,5), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, left_margin=5mm, bottom_margin=5mm, 
	label=L"y = \frac{1}{16} x^{2} + 5", 
	size=(720, 360), tickfontsize=10)

plot!(f,0,4, 
	fillrange = g, fillalpha = 0.25, c = 1, 
	label = "")
plot!(f,1,2, 
	fillrange = g, fillalpha = 0.55, c = 1, 
	label = "")
plot!([2], seriestype="hline", color=:green, label="")


#=
# Calculate the volume with symbolics at interval [0,4]

@syms x

f1(x) = (g(x)-2)^2 - (f(x)-2)^2
V = integrate(pi*(f1(x)), (x, 0, 4))
V.evalf()
d = simplify(V)
=#

