using Plots, ImplicitEquations, LaTeXStrings
gr()

f(x, y) = y^3 + 7y - x^3

plot(f ⩵ 20,  xlims = (-15, 15), ylims=(-15, 15), label=L"y^{3}+7y-x^{3}=0",
	framestyle = :zerolines, legend=:outerright)
