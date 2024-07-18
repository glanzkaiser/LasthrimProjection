using Plots, LaTeXStrings, MTH229
gr()

f(x) = (x-1)^2 + 2

# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = 2.1
               
plot(f, -2, 4, ylims=(-3,10),
    label=L"f(x) = x^{3}+2", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, c), 1.5,3 , label="tangent line for f(x)")
plot!([2.1,2.1],[0,f(2.1)], label="", linecolor=:black, linestyle=:dot)
plot!([2.72,2.72],[0,f(2.1)], label="", linecolor=:black, linestyle=:dot)
plot!([2.72,2.72],[f(2.1),5], label="", linecolor=:green, linestyle=:dot)
plot!([2.82,2.82],[f(2.1),4.7], label="", linecolor=:red, linestyle=:dot)

plot!([2.1,2.72],[f(2.1),f(2.1)], label="", linecolor=:green, linestyle=:dot)


annotate!([(2.85,4.7, (L"-", 8, :red))])
annotate!([(2.85,3.1, (L"-", 8, :red))])
annotate!([(3,3.9, (L"dy", 8, :red))])
annotate!([(2.6,3.9, (L"\delta y", 8, :green))])
annotate!([(2.5,3, (L"\delta x", 8, :green))])
annotate!([(2.1,-0.25, (L"x_{0}", 8, :black))])
annotate!([(2.72,-0.25, (L"x_{0} + \delta x", 8, :black))])

scatter!([2.1], [f(2.1)], color = "red1", label="", markersize = 3)