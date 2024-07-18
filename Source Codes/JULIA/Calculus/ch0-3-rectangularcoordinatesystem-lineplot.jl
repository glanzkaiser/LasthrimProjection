using Plots;

f(x) = -1.3x + 3
plot(f, xlims=(-1,5), ylims=(-1,6), linecolor=:green,
	label=L"y=mx+b", framestyle=:zerolines)
scatter!([0],[3], color = "green", label=L"(0,b)", markersize = 3)

