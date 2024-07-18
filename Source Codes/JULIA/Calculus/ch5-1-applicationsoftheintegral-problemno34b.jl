using Plots, LaTeXStrings, SymPy
gr()

x = collect(range(0, 4, length= 100))
f(x) = 1/(x^2)

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

r1 = round(Area(x -> 1/(x^2), 1, 12/7, 50000), digits=5)
r2 = round(Area(x -> 1/(x^2), 12/7, 6, 50000), digits=5)

plot(f,0,7, xtick=1:5:6, xlims=(0,7), ylims=(0,1.2), 
	framestyle=:zerolines,
	label=L"f(x) = \frac{1}{x^{2}}", legend=:topright)

# Fill the area
plot!(f,1,12/7, label="", fill=(0, 0.25, :blue))
plot!(f,12/7,6, label="", fill=(0, 0.45, :blue))

# The line that bisects the area vertically
plot!([12/7], seriestype="vline", color=:green, label="")

# Annotate the x line that bisects the area
annotate!([(12/7,-0.05, (L"x = \frac{12}{7}", 7, :blue))])

# Annotate the area
annotate!([(1.33,0.25, ("Left area =", 7, :black))])
annotate!([(1.3,0.15, (r1, 7, :black))])
annotate!([(2.23,0.05, ("Right area = ", 7, :black))])
annotate!([(2.97,0.05, (r2, 7, :black))])

# Type at julia REPL after finish to gain the area' approximation: r1