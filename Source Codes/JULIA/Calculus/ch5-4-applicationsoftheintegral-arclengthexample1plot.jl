using Plots, LaTeXStrings; gr()

f(x) = (12/5)x + 1
plot(f, xlims=(0,8), ylims=(0,14),
	label=L"\frac{12}{5} x + 1",
	framestyle=:zerolines)

scatter!([0], [f(0)], color = "red1", label="(0,1)", markersize = 3)
scatter!([5], [f(5)], color = "red1", label="(5,13)", markersize = 3)

