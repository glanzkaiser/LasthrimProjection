using Plots, LaTeXStrings
gr()

x = collect(range(0, 1, length= 100))
f(x) = 2 - x^2
g(x) = x^2

plot(g,0,1.2, xtick=0:1:2, xlims=(0,2.5), ylims=(0,2.3), 
	framestyle=:zerolines,
	label=L"g(x) = x^{2}", legend=:topright)
plot!(f,0,1.2, xtick=0:1:2, xlims=(0,2.5), ylims=(0,2.3), 
	framestyle=:zerolines,
	label=L"f(x) = 2 - x^{2}", legend=:topright)

plot!(x, f, fillrange = g, fillalpha = 0.35, c = 1, 
	label = "", legend=:topright)

plot!(f, 0.4,0.5, fillrange = g, fillalpha = 0.55, c = 3, 
	label = "", legend=:topright)

plot!([0.5,0.5],[f(0.5),g(0.5)], label="", linecolor=:green)
plot!([0.4,0.4],[f(0.4),g(0.4)], label="", linecolor=:green)

annotate!([(0.45,1.87, (L"△ x", 8, :blue))])
annotate!([(0.51,0.17, (L"x_{i}", 8, :blue))])
annotate!([(0.41,0.08, (L"x_{i-1}", 8, :blue))])
