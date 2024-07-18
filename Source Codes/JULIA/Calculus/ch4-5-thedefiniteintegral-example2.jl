using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 40+ 20x*(2-x)

plot(f, ylims= (0,65), xlims=(0,2), 
	ytick=true, xtick=false, framestyle=:zerolines,
	legend=:topright, bottom_margin=10mm, 
	label=L"T(x) = 40 + 20x(2-x)", 
	size=(720, 360), tickfontsize=10)

plot!([1-(sqrt(3)/3),0],[f(1-(sqrt(3)/3)),f(1-(sqrt(3)/3))], 
	label="", linecolor=:green, linestyle=:dash)
plot!([1-(sqrt(3)/3),1-(sqrt(3)/3)],[f(1-(sqrt(3)/3)),0], 
	label="", linecolor=:green, linestyle=:dash)

plot!([1+(sqrt(3)/3),1-(sqrt(3)/3)],[f(1+(sqrt(3)/3)),f(1+(sqrt(3)/3))], 
	label="", linecolor=:green, linestyle=:dash)
plot!([1+(sqrt(3)/3),1+(sqrt(3)/3)],[f(1+(sqrt(3)/3)),0], 
	label="", linecolor=:green, linestyle=:dash)

annotate!([(0.42,-4.7, (L"1 - \frac{\sqrt{3}}{3}", 10, :black))])
annotate!([(1.57,-4.7, (L"1 + \frac{\sqrt{3}}{3}", 10, :black))])