using Plots, LaTeXStrings; 
gr()

f(x) = (4/125)*(x^3) - (3/625)*(x^4)

plot(f, 0,5, xlims=(0,5.1), ylims=(0,1.2), 
	framestyle=:zerolines, label=L"F(x) = \frac{4}{125} x^{3} - \frac{3}{625}x^{4}", 
	linecolor=:blue2)
