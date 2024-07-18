using Plots, LaTeXStrings
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = (x^2)/3 - 4
r = round(Area(x -> f(x), -2, 3, 50000), digits=5)

plot(f,-2.5,4, ylims=(-5,1), framestyle=:zerolines,
	label=L"y = \frac{x^{2}}{3} - 4", legend=:outertop)
plot!(f,-2,3, label="", fill=(0, 0.35, :blue))
annotate!([(1,-1.95, ("A(R) =", 8, :black))])
annotate!([(1.6,-1.95, (-r, 7, :black))])