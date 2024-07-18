using Plots, LaTeXStrings
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = x^4 - 2x^3 + 2
r = round(Area(x -> x^4 - 2x^3 + 2, -1, 2, 50000), digits=5)

plot(f,-2,4, ylims=(0,33),
	label=L"y = x^{4} - 2x^{3} + 2", legend=:outertop)
plot!(f,-1,3, label="", fill=(0, 0.35, :blue))
annotate!([(2.67,5.95, ("A(R) =", 10, :black))])
annotate!([(2.66,2.95, (r, 7, :black))])