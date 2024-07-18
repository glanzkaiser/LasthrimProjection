using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = (cos(x))^5

plot(f,-4.7,4.7, ylims= (-2,2), xlims=(-6,6), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topleft, bottom_margin=5mm, 
	label=L"f(x) = \cos^{5} x", 
	size=(720, 360), tickfontsize=10)

plot!(f,0,4.7, label="", fill=(0, 0.15, :green))
plot!(f,-4.7,0, label="", fill=(0, 0.25, :green))
