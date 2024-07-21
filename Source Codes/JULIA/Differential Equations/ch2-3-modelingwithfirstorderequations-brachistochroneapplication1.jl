using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = log(x)/log(1/3)
g(x) = log(x)/log(3)

plot(f,-1,1; color=:blue, xlims=(-0.1,3.3), xtick=-1:1:3, ylims=(-4,4), 
	label=L"f(x)", framestyle=:zerolines,
	top_margin=10mm, legend=:bottomright)
plot!(g,-1,3, label=L"f^{-1} (x) ")


scatter!([1], [f(1)], color = "blue1", label=L"Q(x_{0} , y_{0})", markersize = 3)
scatter!([3], [g(3)], color = "green3", label=L"R (x_{1}, y_{1})", markersize = 3)