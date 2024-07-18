using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x

plot(f,0,4, xtick=0:4:4, xlims=(0,6), ylims=(0,6), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \frac{r}{h} x", legend=:topright)

plot!(f,0,5, label="", fill=(0, 0.15, :blue))

# Annotations
annotate!([(1.1,1.3, (L"△ y", 8, :blue))])
annotate!([(5.1,1.1, (L"x_{i}", 8, :blue))])
annotate!([(5.2,1.37, (L"x_{i+1}", 8, :blue))])

# Second filling
# Fill right triangle
# from x=1.1 to x=1.4 with lower bound will be 1.1
plot!(f,1.1,1.4, 
	fillrange = 1.1, fillalpha = 0.65, c = 1, 
	label = "")

# Fill long rectangle
# from 1.4 to 5, with lower bound for each: f(1.1)
# with the height is fillrange
plot!([1.4,5], [f(1.1), f(1.1)], 
	fillrange = 1.41, fillalpha = 0.65, c = 1, 
	label = "", linewidth = 0)
