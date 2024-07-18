using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 1/x

plot(f,0,5, xtick=0:1:4, xlims=(0,6), ylims=(0,3), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \frac{1}{t}", legend=:topright)
plot!(f,1,1.6, label="R", fill=(0, 0.35, :blue))


annotate!([(1.6,-0.1, (L"x", 10, :blue))])