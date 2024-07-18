using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x^(2)

plot(f, ylims= (0,8), xlims=(-3,3), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = x^{2}", 
	size=(720, 360), tickfontsize=10)

annotate!([(sqrt(3),-0.3, (L"\sqrt{3}", 10, :blue))])
annotate!([(-sqrt(3),-0.3, (L"- \sqrt{3}", 10, :blue))])

plot!([sqrt(3),sqrt(3)],[f(sqrt(3)),0], 
	label="", linecolor=:green, linestyle=:dash)
plot!([0,sqrt(3)],[f(sqrt(3)),f(sqrt(3))], 
	label="", linecolor=:green, linestyle=:dash)

plot!([-sqrt(3),-sqrt(3)],[f(-sqrt(3)),0], 
	label="", linecolor=:green, linestyle=:dash)
plot!([0,-sqrt(3)],[f(-sqrt(3)),f(-sqrt(3))], 
	label="", linecolor=:green, linestyle=:dash)

plot!([3], seriestype="hline", color=:green, label=L"y=3")