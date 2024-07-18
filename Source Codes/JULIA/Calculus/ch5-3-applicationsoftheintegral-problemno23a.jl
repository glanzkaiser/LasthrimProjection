using Plots, LaTeXStrings
gr()

x = collect(range(0, 1, length= 100))
f(x) = x^2
g(x) = x

plot(g,0,2, xtick=0:1:2, xlims=(0,2.3), ylims=(0,2), 
	framestyle=:zerolines,
	label=L"g(x) = x", legend=:topright)
plot!(f,0,2, xtick=0:1:2, xlims=(0,2.3), ylims=(0,2), 
	framestyle=:zerolines,
	label=L"f(x) = x^{2}", legend=:topright)

plot!(f,0,1, fillrange = g, fillalpha = 0.25, c = 1, 
	label = L"R", legend=:topright)

plot!(f,0.4, 0.5, fillrange = g, fillalpha = 0.55, c = 1, 
	label = "", legend=:topright)

plot!([0.5,0.5],[f(0.5),g(0.5)], label="", linecolor=:green)
plot!([0.4,0.4],[f(0.4),g(0.4)], label="", linecolor=:green)

annotate!([(0.43,0.51, (L"△ x", 8, :blue))])
annotate!([(0.58,0.03, (L"x_{i}", 8, :blue))])
