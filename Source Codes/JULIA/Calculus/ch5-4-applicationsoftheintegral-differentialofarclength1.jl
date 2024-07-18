using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

f(x) = (x-3)^3 + 2

plot(f,2,3, xtick=false, xlims=(0,6), ylims=(0,4), 
	framestyle=:zerolines, bottom_margin=5mm,
	label="", legend=:topright)
plot!(f,3,4, xtick=false, xlims=(0,6), ylims=(0,4), 
	framestyle=:zerolines, linecolor=[:green],
	label="", legend=:topright)

scatter!([2], [f(2)], color = "red1", label="", markersize = 3)
annotate!([(2.4,1.1, (L"(a,f(a))", 10, :black))])
scatter!([3], [f(3)], color = "red1", label="", markersize = 3)
annotate!([(3,1.8, (L"(x,f(x))", 10, :black))])
annotate!([(2.1,1.7, (L"(s(x))", 10, :black))])

annotate!([(2,0, (L"|", 10, :black))])
annotate!([(3,0, (L"|", 10, :black))])
annotate!([(4,0, (L"|", 10, :black))])

annotate!([(2,-0.2, (L"a", 10, :black))])
annotate!([(3,-0.2, (L"x", 10, :black))])
annotate!([(4,-0.2, (L"b", 10, :black))])
