using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x^(2)

plot(f, ylims= (0,33), xlims=(-2,10), 
	ytick=false, xtick=false, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = x^{2}", 
	size=(720, 360), tickfontsize=10)

plot!(f,2,5, label=L"B_{n}", fill=(0, 0.45, :green))
# Fill from x=2 to x=5 with lower bound will be f and the height is fillrange
plot!(f,2,5, 
	fillrange = f(5), fillalpha = 0.35, c = 1, 
	label = L"A_{n}")

# Fill from (0,f(2)) to (2,f(2))
# with the height is fillrange
plot!([0,2], [f(2), f(2)], 
	fillrange = f(5), fillalpha = 0.35, c = 1, 
	label = "", linewidth = 0)

annotate!([(2,-0.8, (L"a", 10, :black))])
annotate!([(5,-0.8, (L"b", 10, :black))])