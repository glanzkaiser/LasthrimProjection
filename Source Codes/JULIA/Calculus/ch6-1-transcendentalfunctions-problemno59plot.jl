using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

a, b = 0, 1

f(x) = x*(log(1/x))
g(x) = (x^2)*(log(1/x))

plot(f, a, b; ylims= (0,0.41), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = x \ \ln (1/x) ", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)
plot!(g, a, b; ylims= (0,0.41), framestyle=:zerolines,
	legend=:topright, label=L" g(x) = x^{2} \ \ln (1/x)", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)
