using Plots, LaTeXStrings; 
gr()

f(x) = (12/625)*(x^2)*(5-x)

plot(f, 0,5, xlims=(0,5), ylims=(0,1.2), 
	framestyle=:zerolines, label=L"f(x) = \frac{12}{625} x^{2} (5-x)", 
	linecolor=:blue2)
