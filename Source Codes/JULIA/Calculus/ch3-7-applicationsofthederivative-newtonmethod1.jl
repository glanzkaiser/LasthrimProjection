using Plots, LaTeXStrings, MTH229
gr()

f(x) = x^(3) + 1.2x - 5

# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = 2
           
plot(f, -1, 4, ylims=(-8,12),
    label=L"f(x) = x^{3} + 1.2x - 5", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, c), 1,3 , label="tangent line for f(2)")

scatter!([2], [f(2)], color = "red1", label="", markersize = 3)
scatter!([1.6], [0], color = "green1", label="", markersize = 3)
scatter!([1.6], [f(1.6)], color = "red1", label="", markersize = 3)

plot!([1.6,1.6],[f(1.6),0], label="", linecolor=:green, linestyle=:dot)

annotate!([(2.3,4.83, (L"x_{1}", 8, :black))])
annotate!([(1.45,1.5, (L"x_{2}", 8, :black))])