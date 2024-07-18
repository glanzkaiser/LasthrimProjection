using Plots, LaTeXStrings
pyplot(fmt=:svg)

a, b = 0, 5

h(x) = sqrt((x+1)/(x+2))

plot(h, a, b; legend=:outerright, label=L"\sqrt{\frac{n+1}{n+2}}", framestyle=:zerolines, 
	xlims = (0,5), xticks = 0:1:5, 
	ylims = (0,1), yticks = 0:0.1:1, 
	linestyle=:dot, size=(720, 360))
