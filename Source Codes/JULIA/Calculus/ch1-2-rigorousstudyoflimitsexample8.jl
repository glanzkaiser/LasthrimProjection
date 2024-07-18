# example graph

using Plots, LaTeXStrings, Plots.PlotMeasures 
gr()

f(x) = 1/(x)

l1 = L"f(x) =\frac{1}{x}"
l2 = L"L = \frac{1}{0.7}"

# xlims defines the most left and right bound for x axis
# ylims defines the top and bottom bound for y axis
# xticks defines the increments of the x axis' ticks
# yticks defines the increments of the y axis' ticks


plot(f, xaxis = "", xlims=(-10,10), ylims=(-10,10), xticks=nothing, yticks=nothing, yaxis = "", label=l1,
	left_margin = 12mm, bottom_margin = 10mm, legend=:outertop)

plot!([2.33], seriestype="hline", color=:green, label="")
plot!([0.05], seriestype="hline", color=:green, label="")
plot!([1.33], seriestype="vline", color=:green, label="")
plot!([0.1], seriestype="vline", color=:green, label="")
plot!([-10,0.7],[f(0.7),f(0.7)], linecolor=:green,label=l2,legend=:outertop, linestyle=:dash)
plot!([0.7,0.7],[-10,f(0.7)], label="", linecolor=:green, linestyle=:dash)

scatter!([0.7], [f(0.7)], color = "red", label="", markersize = 3)

annotate!([(-11,f(2.33), ( L"L - \varepsilon", 10, :black)),
         (-11,f(0.33), ( L"L + \varepsilon", 10, :black)),
         (0.776,-11.37, ("c", 10, :green)),
         (-0.25,-11.37, ( L"c - \delta", 10, :black)),
         (2,-11.37, ( L"c + \delta", 10, :black)),
         (-11,f(0.7), ("L", 10, :green)),
         (9.736,-10.77, ("x", 10, :black)),
         (-9.176,8.97, ("f(x)", 10, :black))])
