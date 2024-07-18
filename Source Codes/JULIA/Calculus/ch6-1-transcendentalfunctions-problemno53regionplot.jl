using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f1(x) = 1/(x^2 + 4)

plot(f1,-1,5, xtick=-1:1:5, xlims=(-1,5), ylims=(-0.25,0.5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \frac{1}{x^{2} + 4}", legend=:topleft)

plot!([1], seriestype="vline", color=:green, label="")
plot!([4], seriestype="vline", color=:green, label="")
plot!([0], seriestype="hline", color=:red, label="")

plot!(f1,1,4, label="", fill=(0, 0.45, :blue))