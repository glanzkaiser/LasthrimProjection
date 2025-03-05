
using Plots,  LaTeXStrings, Plots.PlotMeasures

f(x) = 1/x - 1
plot(f, xlims=(0,1.1), ylims=(-1,17), xtick=false, ytick=false, left_margin=19mm,
	label="", framestyle=:zerolines)

plot!([0.17,0],[f(0.17),8], label="", linecolor=:black, linestyle=:solid)
plot!([0.17,0],[f(0.17),f(0.17)], label="", linecolor=:black, linestyle=:dash)

scatter!([1], [0], color = "black", label="", markersize = 3)
scatter!([0.17], [f(0.17)], color = "black", label="", markersize = 3)

annotate!([(0.07,4.5, (L"x", 10, :black)),
		   (-0.08,5.9, (L"\sqrt{a^{2} - x^{2}}", 10, :black)),
		   (0.1,6.6, (L"a", 10, :black))])
