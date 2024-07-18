using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = sin(0.8x) + 2sqrt(x) + 1
g(x) = cos(0.1x) + 2sqrt(x) + 5
h(x) = cos(0.7x + 0.37π) + sqrt(x) 

plot(f,0,6, xtick=false, ytick=false, xlims=(0,10), ylims=(0,12), 
	framestyle=:zerolines,
	label=L"g(x)", legend=:topright, )
plot!(g,0,6, xtick=false, ytick=false, xlims=(0,10), ylims=(0,12), 
	framestyle=:zerolines,
	label=L"h(x)", legend=:topright)
plot!(h,0,6, xtick=false, ytick=false, xlims=(0,10), ylims=(0,12), 
	framestyle=:zerolines,
	label=L"f(x)", legend=:topright)

plot!(g,1, 5, fillrange = f, fillalpha = 0.25, c = 1, 
	label = L"R_{1}", legend=:topright, bottom_margin=10mm)
plot!(f,1, 5, fillrange = h, fillalpha = 0.55, c = 1, 
	label = L"R_{2}", legend=:topright)

annotate!([(1,0, (L"|", 10, :black))])
annotate!([(1,-0.5, (L"a", 10, :black))])
annotate!([(5,0, (L"|", 10, :black))])
annotate!([(5,-0.5, (L"b", 10, :black))])
annotate!([(1.3,9.7, (L"R_{3} = R_{1} \cup R_{2}", 10, :blue))])