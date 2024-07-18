using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

f(x) = sin(x)+ cos(x/4)^2 + x

plot(f,0,6, xtick=false, xlims=(0,10), ylims=(0,10), 
	framestyle=:zerolines, bottom_margin=5mm,
	label="", legend=:topright)

scatter!([2.5], [f(2.5)], color = "red1", label="", markersize = 3)
scatter!([3], [f(3)], color = "red1", label="", markersize = 3)

plot!([2.6,3],[4.1,4], label="", linecolor=:black)
plot!([2.6,2.55],[4.2,4], label="", linecolor=:black)
plot!([3,2.97],[4.1,3.9], label="", linecolor=:black)

annotate!([(2.8,4.4, (L"△ s_{i}", 8, :black))])
