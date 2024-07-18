using Plots, LaTeXStrings, MTH229
gr()

f(x) = (3x^(5) - 20x^(3))/32

plot(f, -4, 3, xlims=(-4,2.8), ylims=(-3,3),
    label=L"f(x) = \frac{3x^{5} - 20x^{3}}{32}", framestyle=:zerolines,
    legend=:outerright)

plot!([2,2],[f(2),3], label="", linecolor=:green, linestyle=:dot)
plot!([-2,-2],[f(-2),3], label="", linecolor=:green, linestyle=:dot)
plot!([sqrt(2),sqrt(2)],[f(sqrt(2)),2.5], label="", linecolor=:green, linestyle=:dot)
plot!([-sqrt(2),-sqrt(2)],[f(-sqrt(2)),2.5], label="", linecolor=:green, linestyle=:dot)

annotate!([(-3,3.15, (L"f'>0", 6, :black))])
annotate!([(-3,3, ("increasing", 6, :black))])
annotate!([(-4,3, (L"|", 8, :red))])
annotate!([(-1.2,3.15, (L"f'<0", 6, :black))])
annotate!([(-1.2,3, ("decreasing", 6, :black))])
annotate!([(-2,3, (L"|", 8, :red))])
annotate!([(0.9,3.15, (L"f'<0", 6, :black))])
annotate!([(0.9,3, ("decreasing", 6, :black))])
annotate!([(0,3, (L"|", 8, :red))])
annotate!([(2,3, (L"|", 8, :red))])
annotate!([(2.9,3.15, (L"f'>0", 6, :black))])
annotate!([(2.9,3, ("increasing", 6, :black))])
annotate!([(4,3, (L"|", 8, :red))])

annotate!([(-2.7,2.65, (L"f'' < 0", 6, :black))])
annotate!([(-2.7,2.5, ("concave down", 6, :black))])
annotate!([(-0.9,2.65, (L"f'' > 0", 6, :black))])
annotate!([(-0.9,2.5, ("concave up", 6, :black))])
annotate!([(0.8,2.65, (L"f'' < 0", 6, :black))])
annotate!([(0.8,2.5, ("concave down", 6, :black))])
annotate!([(2.5,2.65, (L"f'' > 0", 6, :black))])
annotate!([(2.5,2.5, ("concave up", 6, :black))])
annotate!([(-4,2.5, (L"|", 8, :red))])
annotate!([(-sqrt(2),2.5, (L"|", 8, :red))])
annotate!([(0,2.5, (L"|", 8, :red))])
annotate!([(3.5,2.5, (L"|", 8, :red))])
annotate!([(sqrt(2),2.5, (L"|", 8, :red))])
annotate!([(-sqrt(2),2.5, (L"|", 8, :red))])

annotate!([(-sqrt(2),0, (L"|", 8, :black))])
annotate!([(sqrt(2),0, (L"|", 8, :black))])
annotate!([(sqrt(2),-0.15, (L"\sqrt{2}", 8, :black))])
annotate!([(-sqrt(2),-0.15, (L"- \sqrt{2}", 8, :black))])
annotate!([(-2,0, (L"|", 8, :black))])
annotate!([(2,0, (L"|", 8, :black))])
annotate!([(-2,-0.15, (L"-2", 8, :black))])
annotate!([(2,-0.15, (L"2", 8, :black))])

scatter!([-2], [f(-2)], color = "green1", label="Local max (-2,2)", markersize = 3)
scatter!([2], [f(2)], color = "red", label="Local min (2,-2)", markersize = 3)

scatter!([0], [f(0)], color = "orange1", label="inflection points", markersize = 3)
scatter!([-sqrt(2)], [f(-sqrt(2))], color = "orange1", label="", markersize = 3)
scatter!([sqrt(2)], [f(sqrt(2))], color = "orange1", label="", markersize = 3)