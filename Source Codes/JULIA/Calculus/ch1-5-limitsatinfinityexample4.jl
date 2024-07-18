using Plots, LaTeXStrings
pyplot(fmt=:svg)

a, b = -10, 10

h(x) = 2x/(x-1)

plot(h, a, b; legend=:outerright, label=L"\frac{2x}{x-1}", framestyle=:zerolines, 
	xlims = (-10,10), xticks = -10:5:10, 
	ylims = (-10,10), yticks = -10:5:10, 
	size=(720, 360))
plot!([1], seriestype="vline", linestyle=:dash, color=:black, label="")
plot!([2], seriestype="hline", linestyle=:dash, color=:black, label="")
