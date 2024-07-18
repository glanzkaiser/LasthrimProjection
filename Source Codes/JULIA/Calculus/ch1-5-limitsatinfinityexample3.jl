using Plots, LaTeXStrings
pyplot(fmt=:svg)

a, b = -10, 10

h(x) = 1/((x-1)^(2))

plot(h, a, b; legend=:outerright, label=L"\frac{1}{(x-1)^{2}}", framestyle=:zerolines, 
	xlims = (-10,10), xticks = -10:5:10, 
	ylims = (-10,10), yticks = -10:5:10, 
	size=(720, 360))
plot!([1], seriestype="vline", linestyle=:dash, color=:black, label="")
