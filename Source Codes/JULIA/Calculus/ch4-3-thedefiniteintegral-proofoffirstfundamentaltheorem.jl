using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

f(x) = 4 + log(x)/8 + cbrt(tan.(x)) + sin.(5x)
g(x) = 2
               
plot(f, 1.59, 4.1, xticks=false, yticks=false, ylims=(0,6),
    label=L"y = f(t) = 4 + \frac{log(t)}{8} + (\tan(t))^{1/3} + \sin (5t)", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot!([0,2.83],[f(2.83),f(2.83)], label="", linestyle=:dot, linecolor=:green)
plot!([0,2.2],[f(2.2),f(2.2)], label="", linestyle=:dot, linecolor=:green)

plot!([1.73,1.73],[0,f(1.73)], label="", linecolor=:green)
plot!([2.83,2.83],[0,f(2.83)], label="", linecolor=:green)

annotate!([(1.73,-0.15, (L"x", 10, :black))])
annotate!([(2.83,-0.15, (L"x+h", 10, :black))])
annotate!([(-0.3,f(2.2), (L"m", 10, :black))])
annotate!([(-0.3,f(2.83), (L"M", 10, :black))])
annotate!([(0,f(2.2), (L"-", 10, :black))])
annotate!([(0,f(2.83), (L"-", 10, :black))])
