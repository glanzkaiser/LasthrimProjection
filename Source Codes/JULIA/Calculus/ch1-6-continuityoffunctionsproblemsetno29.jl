using Plots, LaTeXStrings
pyplot() 
#gr()

h(x) = (x^(2) + abs(x-1))/((x+1)^(1/3))

plot(h; 
	legend=:outerright, label=L"\frac{u^{2} + |u - 1|}{\sqrt[3]{u+1}}", 
	framestyle=:zerolines, 
	xlims = (-5,5), 
	ylims = (-100,100), 
	size=(720, 360))
