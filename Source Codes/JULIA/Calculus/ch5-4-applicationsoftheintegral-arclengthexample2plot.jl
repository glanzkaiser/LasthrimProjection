using Plots, LaTeXStrings; gr()

f(x) = x^(3/2)
plot(f, xlims=(0,8), ylims=(0,14),
	label=L"x^{3/2}",
	framestyle=:zerolines)

scatter!([1], [f(1)], color = "red1", label="(1,1)", markersize = 3)
scatter!([4], [f(4)], color = "red1", label="(4,8)", markersize = 3)

