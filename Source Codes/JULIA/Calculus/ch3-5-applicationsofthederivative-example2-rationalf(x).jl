using Plots, LaTeXStrings, MTH229

gr()

f(x) = (x^(2) - 2x + 4)/(x-2)
g(x) = x

plot(f, -6, 8, xlims=(-6,8), ylims=(-5,10),
    label=L"f(x) = \frac{x^{2} - 2x + 4}{x-2}", framestyle=:zerolines,
    top_margin = 15mm, legend=:outerright)
plot!(g, linestyle=:dot, label=L"y=x")
plot!([2], seriestype="vline", color=:red, label="", linestyle=:dot)

annotate!([(-6,13, (L"|", 8, :red))])
annotate!([(-3,13.35, (L"f'>0", 6, :black))])
annotate!([(-3,13, ("increasing", 6, :black))])
annotate!([(0.9,13.35, (L"f'<0", 6, :black))])
annotate!([(0.9,13, ("decreasing", 6, :black))])
annotate!([(0,13, (L"|", 8, :red))])
annotate!([(2,13, (L"|", 8, :red))])
annotate!([(2.9,13.35, (L"f'<0", 6, :black))])
annotate!([(2.9,13, ("decreasing", 6, :black))])
annotate!([(4,13, (L"|", 8, :red))])
annotate!([(6,13.35, (L"f'>0", 6, :black))])
annotate!([(6,13, ("increasing", 6, :black))])
annotate!([(8,13, (L"|", 8, :red))])

annotate!([(-6,11, (L"|", 8, :red))])
annotate!([(-3,11.35, (L"f'' < 0", 6, :black))])
annotate!([(-3,11, ("concave down", 6, :black))])
annotate!([(2,11, (L"|", 8, :red))])
annotate!([(5,11.35, (L"f'' > 0", 6, :black))])
annotate!([(5,11, ("concave up", 6, :black))])
annotate!([(8,11, (L"|", 8, :red))])

scatter!([0], [f(0)], color = "green1", label="Local max (0,2)", markersize = 3)
scatter!([4], [f(4)], color = "red", label="Local min (4,6)", markersize = 3)
