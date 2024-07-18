using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = 0.23x^2
g(x) = -0.23x^2 + 2
plot(f,-4,0; color=:blue, xlims=(-4,5), xtick=-3:1:4, ylims=(-1,4), 
	framestyle=:zerolines,legend=false)
plot!(g, 0,4; color=:blue) 

scatter!([0], [g(0)], color = "red1", label="", markersize = 3)
