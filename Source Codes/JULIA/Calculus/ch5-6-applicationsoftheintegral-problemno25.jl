using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x^3

plot(f,0,6, xtick=true, ytick=true, xlims=(0,3), ylims=(0,5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = x^{3}", legend=:topright, )

plot!([1], seriestype="vline", color=:green, label="")

plot!(f,0,1, label="", fill=(0, 0.15, :blue))
