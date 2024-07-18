using Plots, LaTeXStrings, Roots, SymPy
gr()

x = collect(range(0, 6, length= 100))
f(x) = sqrt(x)
g(x) = -x + 6
# First, find the inverse of f and g then solve them by finding the roots of f-g in y terms
h(y) = y^2 + y - 6
k(y) = 6 - y - y^2

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

r1 = round(Area(y -> (3y + 4 - y^(2))/(4), -1, 4, 50000), digits=5)

plot(g,0,7, xtick=0:7:7, xlims=(0,7), ylims=(-1,10), 
	framestyle=:zerolines,
	label=L"g: y = -x + 6", legend=:topleft)
plot!(f,0,7, xtick=0:7:7, xlims=(0,7), ylims=(-1,10), 
	framestyle=:zerolines,
	label=L"f: y = \sqrt{x}", legend=:topleft)

plot!(f,0,4, label="", fill=(0, 0.35, :blue))
plot!(g,4,6, label="", fill=(0, 0.35, :blue))

plot!([3,4.3],[f(3),g(4.3)], label="", linecolor=:green)
plot!([2.5,4.5],[f(2.5),g(4.5)], label="", linecolor=:green)

annotate!([(2.66,1.9, (L"△ y", 8, :blue))])
annotate!([(4.6,1.6, (L"y_{i}", 6, :blue))])
annotate!([(4.37,1.88, (L"y_{i+1}", 6, :blue))])

plot!([2.42,4.5],[1.3,1.3], label="", linecolor=:blue)
annotate!(2.42,1.3, Plots.text("|", 10, :blue, rotation = 0 ))
annotate!(4.5,1.3, Plots.text("|", 10, :blue, rotation = 0 ))

annotate!([(3.41,1.1, (L" y^{2} + y - 6 ", 6, :blue))])

# To find roots / intersection between two curves (the root is in y term)
# find_zeros(h, -10,10)

# To find area subtract the one with larger x-values to the one with smaller x-values
# integrate(k,0,2).evalf()