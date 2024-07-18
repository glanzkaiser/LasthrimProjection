using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = sin(0.8x) + 2sqrt(x) + 1
g(x) = cos(1.1x) + 2sqrt(x) + 5

plot(f,0,6, xtick=false, ytick=false, xlims=(0,10), ylims=(0,12), 
	framestyle=:zerolines,
	label="", legend=:topright, )
plot!(g,0,6, xtick=false, ytick=false, xlims=(0,10), ylims=(0,12), 
	framestyle=:zerolines,
	label="", legend=:topright)

plot!(g,1, 3, fillrange = f, fillalpha = 0.25, c = 1, 
	label = L"R_{1}", legend=:topright, bottom_margin=10mm)
plot!(g,3, 5, fillrange = f, fillalpha = 0.45, c = 1, 
	label = L"R_{2}", legend=:topright)

plot!([3,3],[f(3),g(3)], label="", linecolor=:green)

annotate!([(1,0, (L"|", 10, :black))])
annotate!([(1,-0.5, (L"a", 10, :black))])
annotate!([(3,0, (L"|", 10, :black))])
annotate!([(3,-0.5, (L"b", 10, :black))])
annotate!([(5,0, (L"|", 10, :black))])
annotate!([(5,-0.5, (L"c", 10, :black))])
annotate!([(2,8.5, (L"R_{3} = R_{1} \cup R_{2}", 10, :blue))])