using Plots, LaTeXStrings
pyplot(fmt=:svg)

a, b = -3,3

h(x) = x*(sin.(1/x))

plot(h, a, b; legend=:outerright, label=L"x \ \sin \frac{1}{x}", framestyle=:zerolines, 
	xlims = (-3,3), xticks = -3:1:3, 
	ylims = (-2,2), yticks = -2:1:2, 
	size=(720, 360))
