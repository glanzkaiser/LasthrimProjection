using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x

plot(f,0,4, xtick=0:4:4, xlims=(0,6), ylims=(0,6), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \frac{r}{h} x", legend=:topright)

plot!(f,0,5, label="", fill=(0, 0.15, :blue))
plot!(f,2,2.3, label="", fill=(0, 0.35, :blue))

# Annotations
annotate!([(2.12,2.3, (L"△ x", 8, :blue))])
annotate!([(2,-0.2, (L"x_{i}", 8, :blue))])
annotate!([(2.4,-0.2, (L"x_{i+1}", 8, :blue))])
