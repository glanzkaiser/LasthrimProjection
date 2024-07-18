using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 1 +  cos(x^(2)/3) + log(x)

plot(f,1,5, ylims= (0,5), xlims=(0,5), 
	ytick=false, xtick=false, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = 1 + \cos(\frac{x^{2}}{3}) + \log(x)", 
	size=(720, 360), tickfontsize=10)
# Fill from (2,0) to (4.5,0)
# with the height is fillrange
plot!([2,4.5], [0, 0], 
	fillrange = f(1), fillalpha = 0.35, c = 1, 
	label = L"Area = c*f(c)", linewidth = 0)
plot!([2,4.5], [2.2, 2.2], 
	fillrange = f(1), fillalpha = 0.35, c = 1, 
	label = "", linewidth = 0)

# Area under the curve
#plot!(f,2,4.5, label=L"B_{n}", fill=(0, 0.15, :green))

annotate!([(2,-0.1, (L"a", 10, :black))])
annotate!([(3.7,-0.1, (L"c", 10, :black))])
annotate!([(4.5,-0.1, (L"b", 10, :black))])

plot!([3.7,3.7],[f(3.7),0], 
	label="", linecolor=:green, linestyle=:dash)
