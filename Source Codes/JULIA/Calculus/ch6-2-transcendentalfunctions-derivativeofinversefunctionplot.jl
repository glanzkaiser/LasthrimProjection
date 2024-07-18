using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

a, b = 0, 1

f(x) = abs((x*log(1/x)) - (x^2)*log(1/x))

plot(f, a, b; ylims= (0,1), framestyle=:zerolines,
	legend=:topright, label="Has no inverse", 
	left_margin=5mm, size=(720, 360), tickfontsize=10, line=(:dash))

plot!(f, 0.25, 0.5; ylims= (0,1), framestyle=:zerolines,
	legend=:topright, label="Domain restricted, has inverse ", 
	left_margin=5mm, size=(720, 360), tickfontsize=10, linecolor=(:green))
