using Plots, LaTeXStrings
pyplot() 
#gr()

h(x) = (33 - x^(2))/(x*pi + 3x - 3*pi - x^(2))

plot(h; 
	legend=:outerright, label=L"\frac{33 - x^{2}}{xπ+3x-3π-x^{2}}", 
	framestyle=:zerolines, 
	xlims = (-5,5), 
	ylims = (-100,100), 
	size=(720, 360))
