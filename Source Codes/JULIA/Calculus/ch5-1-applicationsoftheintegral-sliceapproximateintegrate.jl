using Plots, LaTeXStrings
gr()

f(x) = 1 + sqrt(x)

plot(f,0,5, xtick=0:4:4, ylims=(0,4), framestyle=:zerolines,
	label=L"y = 1 + \sqrt{x}", legend=:outertop)
plot!(f,0,4, label="", fill=(0, 0.15, :blue))
# Fill the slice
plot!(f,2,2.3, label="", fill=(0, 0.35, :blue))

plot!([2,2],[0,f(2)], label="", linecolor=:green)
plot!([2.3,2.3],[0,f(2.3)], label="", linecolor=:green)

# The helping lines
plot!([2.4,2.4],[0.05,1], label="", linecolor=:green)
plot!([2.4,2.4],[1.4,2.5], label="", linecolor=:green)
annotate!([(2.4,0.04, (L"-", 10, :green))])
annotate!([(2.4,2.49, (L"-", 10, :green))])

# Area above
annotate!([(2.12,2.6, (L"△ x_{i}", 8, :blue))])
annotate!([(2.3,-0.2, (L"x_{i}", 8, :blue))])
annotate!([(2.77,1.2, (L"f(x_{i}) = 1 + \sqrt{x_{i}}", 8, :blue))])
