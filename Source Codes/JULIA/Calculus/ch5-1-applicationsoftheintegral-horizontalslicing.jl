using Plots, LaTeXStrings, InverseFunctions
gr()

x = collect(range(0, 4, length= 100))
f(x) = sqrt(4x)
g(x) = (4x - 4)/3

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

r1 = round(Area(y -> (3y + 4 - y^(2))/(4), -1, 4, 50000), digits=5)

plot(g,-1,4, xtick=-1:1:4, xlims=(-1,4), ylims=(-2,4), 
	framestyle=:zerolines,
	label=L"g: 4x - 3y = 4", legend=:topleft)
plot!(f,-1,4, xtick=-1:1:4, xlims=(-1,4), ylims=(-2,4), 
	framestyle=:zerolines,
	label=L"f: y^{2} = 4x ", legend=:topleft)

plot!(x, f, fillrange = g, fillalpha = 0.35, c = 1, 
	label = L"f - g = y^{2} - 3y - 4 = 0", legend=:topleft)

plot!([0.42,1.95],[f(0.42),g(1.95)], label="", linecolor=:green)
plot!([0.3,1.8],[f(0.3),g(1.8)], label="", linecolor=:green)

annotate!([(0.27,1.27, (L"△ y", 8, :blue))])
annotate!([(1.95,0.97, (L"y_{i}", 8, :blue))])
annotate!([(2.13,1.17, (L"y_{i+1}", 8, :blue))])

#plot!([0.45,1.97],[1.5,1.5], label="", linecolor=:blue)
#annotate!(0.45,1.5, Plots.text("|", 10, :blue, rotation = 0 ))
#annotate!(1.97,1.5, Plots.text("|", 10, :blue, rotation = 0 ))

annotate!([(1.41,1.9, (L" \frac{3y+4}{4} - \frac{y^{2}}{4}", 6, :blue))])

# Create curly bracket
topy = 1.5

# Left bracket starting from 0.143239π, and ending at the middle at 0.3851545π 
bezxl = [0.143239π, 0.143239π, 0.3851545π, 0.3851545π] 
bezyl = [2, topy, 2, topy]
curves!(bezxl, bezyl; linecolor=:blue, label="left")

# Right bracket starting from the middle at 0.3851545π and end at 0.62707π
bezxr = [0.3851545π, 0.3851545π, 0.62707π, 0.62707π]
bezyr = [topy, 2, topy, 2]
curves!(bezxr, bezyr; linecolor=:blue, label="right")

# Type at julia REPL after finish to gain the area' approximation: r1