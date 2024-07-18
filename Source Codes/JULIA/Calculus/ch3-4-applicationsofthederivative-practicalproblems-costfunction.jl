using MTH229, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 0.3 + exp(-x)*sin(3x)

plot(f, 0, 1, xlims=(0,0.41), xticks = false, yticks = false,
    label=L"", framestyle=:zerolines, bottom_margin = 10mm,
     legend=:outerright)

scatter!([0.21], [f(0.21)], color = "blue", label="", markersize = 3)

plot!([0.21,0.21],[f(0.21),0], label="", linecolor=:green, linestyle=:dash)
plot!([0.21,0],[f(0.21),f(0.21)], label="", linecolor=:green, linestyle=:dash)

plot!([0.21,0.3],[f(0.21),f(0.21)], label="", linecolor=:green, linestyle=:dash)

plot!([0.3,0.3],[f(0.3),0], label="", linecolor=:green, linestyle=:dash)
plot!([0.3,3],[f(0.3),f(0.3)], label="", linecolor=:green)
plot!([0.3,3],[f(0.21),f(0.21)], label="", linecolor=:green)

annotate!([(0.2,-0.06, (L"2000", 8, :green))])
annotate!([(0.3,-0.06, (L"2000 + x", 8, :green))])
annotate!([(0.25,0.73, (L"△x", 10, :green))])
annotate!([(0.33,0.82, (L"△C", 10, :green))])
annotate!([(0.03,0.97, (L"C(x)", 10, :black))])
annotate!([(0.41,0.03, (L"x", 10, :black))])