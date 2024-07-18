using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

a, b = 0, 1

f(x) = abs((x*log(1/x)) - (x^2)*log(1/x))
fd1(x) = abs(-2x*(log(1/x)) + x + log(1/x) - 1) # diff(f(x),x)

plot(f, a, b; ylims= (0,1), framestyle=:zerolines,
	legend=:topright, label=L" |f(x) - g(x)| = |x \ \ln (1/x) - x^{2} \ \ln (1/x)|", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)
plot!(fd1, a, b; ylims= (0,1), framestyle=:zerolines,
	legend=:topright, label=L" |f'(x)|", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)

scatter!([0.236], [f(0.236)], color = "red1", label="", markersize = 3)
scatter!([0.236], [h(0.236)], color = "red1", label="", markersize = 3)
