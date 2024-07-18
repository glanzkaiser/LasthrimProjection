using Plots, LaTeXStrings, MTH229
gr()

f(x) = x/(1+x^2)

plot(f, -4, 4, ylims=(-1,2),
    label=L"f(x) = \frac{x}{1 + x^{2}}", framestyle=:zerolines,
    legend=:outerright)

plot!([sqrt(3),sqrt(3)],[0,1], label="", linecolor=:green, linestyle=:dot)
plot!([-sqrt(3),-sqrt(3)],[f(-sqrt(3)),1], label="", linecolor=:green, linestyle=:dot)
plot!([-1,-1],[f(-1),1.5], label="", linecolor=:green, linestyle=:dot)
plot!([1,1],[0,1.5], label="", linecolor=:green, linestyle=:dot)

annotate!([(-2.2,1.5, ("decreasing", 6, :black))])
annotate!([(-4,1.5, (L"|", 8, :red))])
annotate!([(-1,1.5, (L"|", 8, :red))])
annotate!([(0,1.5, ("increasing", 6, :black))])
annotate!([(1,1.5, (L"|", 8, :red))])
annotate!([(2.5,1.5, ("decreasing", 6, :black))])
annotate!([(4,1.5, (L"|", 8, :red))])

annotate!([(-2.7,1, ("concave down", 6, :black))])
annotate!([(-0.9,1, ("concave up", 6, :black))])
annotate!([(0.8,1, ("concave down", 6, :black))])
annotate!([(2.5,1, ("concave up", 6, :black))])
annotate!([(-4,1, (L"|", 8, :red))])
annotate!([(-sqrt(3),1, (L"|", 8, :red))])
annotate!([(0,1, (L"|", 8, :red))])
annotate!([(sqrt(3),1, (L"|", 8, :red))])
annotate!([(3.5,1, (L"|", 8, :red))])
annotate!([(sqrt(3),0, (L"|", 8, :black))])
annotate!([(-sqrt(3),0, (L"|", 8, :black))])
annotate!([(sqrt(3),-0.1, (L"\sqrt{3}", 8, :black))])
annotate!([(-sqrt(3),-0.1, (L"- \sqrt{3}", 8, :black))])