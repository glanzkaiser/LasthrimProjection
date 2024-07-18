using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = sin(2x) 

plot(f, ylims= (-1,1), xlims=(0,7), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:bottomleft, bottom_margin=5mm, 
	label=L"f(x) = \sin (2x)", 
	size=(720, 360), tickfontsize=10)

plot!(f,0,3.14, label="", fill=(0, 0.35, :green))
plot!(f,3.14,6.28, label="", fill=(0, 0.15, :green))

annotate!([(0.1,-0.1, (L"a", 10, :blue))])
annotate!([(3.2,-0.1, (L"b", 10, :red))])

annotate!([(2.9,0.1, (L"a + p", 10, :blue))])
annotate!([(6.12,0.1, (L"b + p", 10, :red))])
