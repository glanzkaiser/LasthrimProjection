using Plots;

m1 = 3.6

f(x) = (1/m1)x + 0.3
g(x) = -m1*x + 5

plot(f, xlims=(-1,5), ylims=(-1,4), xtick=false,  ytick=false,
	linecolor=:green, label=L"l_{1}", framestyle=:zerolines)
plot!(g, linecolor=:blue,
	label=L"l_{2}")

scatter!([3],[f(3)], color = "green", label="", markersize = 3)
scatter!([0.8],[g(0.8)], color = "blue", label="", markersize = 3)
scatter!([1.205],[g(0.8)], color = "blue", label="", markersize = 3)
scatter!([1.205],[g(1.205)], color = "black", label="", markersize = 3)

plot!([1.205,0.8],[g(0.8),g(0.8)], label="", linecolor=:black, linestyle=:solid)
plot!([1.205,1.205],[g(0.8),g(1.205)], label="", linecolor=:black, linestyle=:solid)
plot!([3,3],[f(3),f(1.205)], label="", linecolor=:black, linestyle=:solid)
plot!([1.205,3],[f(1.205),f(1.205)], label="", linecolor=:black, linestyle=:solid)

annotate!([(3.1,0.9, (L"m", 8, :black))])
annotate!([(1,2.3, (L"m", 8, :black))])
annotate!([(1.3,1.5, (L"1", 8, :black))])
annotate!([(2.2,0.5, (L"1", 8, :black))])
annotate!([(1.1,0.5, (L"A", 8, :black))])
annotate!([(3.1,0.5, (L"B", 8, :black))])
annotate!([(3.1,1.3, (L"C", 8, :black))])
annotate!([(0.7,2.1, (L"D", 8, :black))])
annotate!([(1.3,2.1, (L"E", 8, :black))])