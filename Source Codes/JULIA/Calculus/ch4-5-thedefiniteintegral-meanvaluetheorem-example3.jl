using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) =x*sin(x)^4 + x^3

plot(f, ylims= (-100,100), xlims=(-6,6), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topleft, bottom_margin=5mm, 
	label=L"f(x) = x \ \sin^{4} x + x^{3}", 
	size=(720, 360), tickfontsize=10)

plot!(f,0,4.5, label="", fill=(0, 0.15, :green))
plot!(f,-4.5,0, label="", fill=(0, 0.25, :green))
