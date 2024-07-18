using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 1/(x+1)^(2)

plot(f, ylims= (0,1), xlims=(0,2), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = \frac{1}{(x+1)^{2}}", 
	size=(720, 360), tickfontsize=10)

annotate!([(-1 + sqrt(3),-0.1, (L"-1 + \sqrt{3}", 10, :blue))])

plot!([-1+sqrt(3),-1+sqrt(3)],[f(-1+sqrt(3)),0], 
	label="", linecolor=:green, linestyle=:dash)

plot!([1/3], seriestype="hline", color=:green, label=L"y=\frac{1}{3}")