using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = sin(x)

plot(f, ylims= (-1,1), xlims=(-2,2), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:bottomright, bottom_margin=5mm, 
	label=L"f(x) = \sin(x)", 
	size=(720, 360), tickfontsize=10)

annotate!([(0.5,0.2, (L"+", 10, :blue))])
annotate!([(-0.5,-0.2, (L"-", 10, :red))])

plot!(f,0,2, label="", fill=(0, 0.15, :green))
plot!(f,-2,0, label="", fill=(0, 0.25, :green))
