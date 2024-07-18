using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

# For the curve
f(x) = x^2
g(x) = sqrt(8x)
# Plotting time

plot(f, ylims= (0,5), xlims=(0,4), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = x^{2}", 
	size=(720, 360), tickfontsize=10)

plot!(g, ylims= (0,5), xlims=(0,4), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"g(x) = \sqrt{8x}", 
	size=(720, 360), tickfontsize=10)

# First filling
x = collect(range(0, 2, length= 100))
plot!(x, f, fillrange = g, fillalpha = 0.55, c = 3, 
	label = L"f(x) - g(x) = x^{2} - \sqrt{8x}", legend=:topright)

# Vertical slicing
x = collect(range(1, 1.2, length= 100))
plot!(x, f, fillrange = g, fillalpha = 0.55, c = 2, 
	label = "", legend=:topright)

annotate!([(1.1,3.3, (L"△x", 10, :black))])