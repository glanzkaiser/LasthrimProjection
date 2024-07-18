using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

# To plot a circle of radius 2 centered at (1, 1) 
θ = 0:0.001:2π
x = 0 .+ 2cos.(θ)
y = 0 .+ 2sin.(θ)
plot(x, y, xtick=false, framestyle=:zerolines, legend=:bottomleft,
	label=L"x^{2} + y^{2} = 4")

plot!([1,1],[sqrt(3),-sqrt(3)], label="", linecolor=:green)
scatter!([1], [sqrt(3)], color = "red1", label="", markersize = 3)
scatter!([1], [-sqrt(3)], color = "red1", label="", markersize = 3)
annotate!([(1.4,1.8, (L"(x, \sqrt{4-x^{2}})", 8, :black))])
annotate!([(1.4,-1.8, (L"(x, -\sqrt{4-x^{2}})", 8, :black))])
