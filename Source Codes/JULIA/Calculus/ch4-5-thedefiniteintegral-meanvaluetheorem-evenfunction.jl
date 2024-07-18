using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 2 + cos(x)

plot(f,-3,3, ylims= (0,3.5), xlims=(-4,4), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = 2 + \cos(x)", 
	size=(720, 360), tickfontsize=10)

annotate!([(3,-0.2, (L"a", 10, :blue))])
annotate!([(-3,-0.2, (L"-a", 10, :blue))])

plot!(f,0,3, label="", fill=(0, 0.15, :green))
plot!(f,-3,0, label="", fill=(0, 0.25, :green))
