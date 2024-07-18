using Plots, LaTeXStrings
pyplot(fmt=:svg)

a, b = -5, 5

h(x) = (cos.(x))/x

plot(h, a, b; legend=:outerright, label=L"\frac{cos \ x}{x}", framestyle=:zerolines, 
	xlims = (-5,5), xticks = -5:1:5, 
	ylims = (-5,5), yticks = -5:1:5, 
	size=(720, 360))
