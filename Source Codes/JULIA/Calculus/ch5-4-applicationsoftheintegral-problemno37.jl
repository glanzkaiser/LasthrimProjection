using Plots, LaTeXStrings; gr()

f1(x) = x
f2(x) = x^2
f3(x) = x^4
f4(x) = x^10
f5(x) = x^100
f6(x) = x^10000

plot(f1, xlims=(0,1), ylims=(0,1),
	label=L"y = x",framestyle=:zerolines)
plot!(f2, xlims=(0,1), ylims=(0,1),
	label=L"y = x^{2}",framestyle=:zerolines)
plot!(f3, xlims=(0,1), ylims=(0,1),
	label=L"y = x^{4}",framestyle=:zerolines)
plot!(f4, xlims=(0,1), ylims=(0,1),
	label=L"y = x^{10}",framestyle=:zerolines)
plot!(f5, xlims=(0,1), ylims=(0,1),
	label=L"y = x^{100}",framestyle=:zerolines)
plot!(f6, xlims=(0,1), ylims=(0,1),
	label=L"y = x^{10,000}",framestyle=:zerolines, linecolor=:red)

