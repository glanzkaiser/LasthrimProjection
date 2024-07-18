using Plots, LaTeXStrings
gr()

f(x) = 2x-4
g(x) = 2*sqrt(x)

plot(f,-5,5, xtick=0:1:5, xlims=(0,5), ylims=(-5,5), 
	framestyle=:zerolines,
	label="", legend=:topright)
plot!(g,-5,5, xtick=0:1:5, xlims=(0,5), ylims=(-5,5), 
	framestyle=:zerolines,
	label="", legend=:topright)

plot!(g,1, 4, fillrange = f, fillalpha = 0.25, c = 1, 
	label = "", legend=:topright)

plot!([1,1],[f(1),g(1)], label="", linecolor=:green)
