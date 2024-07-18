using Plots, LaTeXStrings
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = x^3 - 3x^2 - x + 3
r1 = round(Area(x -> f(x), -1, 1, 50000), digits=5)
r2 = round(Area(x -> f(x), 1, 2, 50000), digits=5)

plot(f,-1.5,3.5, ylims=(-4,4), framestyle=:zerolines,
	label=L"y = x^{3} - 3x^{2} - x + 3", legend=:outertop)
plot!(f,-1,2, label="", fill=(0, 0.35, :blue))
# Area above
annotate!([(-0.5,1.25, (L"A(R_{1}) =", 8, :black))])
annotate!([(-0.2,1.25, (r1, 7, :black))])
# Area below
annotate!([(1.4,-0.65, (L"A(R_{2}) =", 8, :black))])
annotate!([(1.82,-0.65, (-r2, 7, :black))])
# Total Area
annotate!([(1.4,1.65, (L"A(R) = A(R_{1}) + A(R_{2}) = ", 8, :black))])
annotate!([(2.33,1.65, (r1-r2, 7, :black))])