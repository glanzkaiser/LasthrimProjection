using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 1 - (x^2)/4

plot(f,0,3, xtick=0:2:2, xlims=(0,3), ylims=(0,1.5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = 1 - \frac{x^{2}}{4}", legend=:topright)

plot!(f,0,2, label="", fill=(0, 0.15, :blue))
plot!(f,0.8,1, label="", fill=(0, 0.35, :blue))

# Annotations
annotate!([(0.9,0.9, (L"△ x", 8, :blue))])
annotate!([(1,-0.1, (L"x_{i}", 8, :blue))])
annotate!([(0.84,-0.1, (L"x_{i+1}", 8, :blue))])
