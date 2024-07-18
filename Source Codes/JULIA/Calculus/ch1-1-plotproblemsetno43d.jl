# example graph 43(d)

using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 1/abs(x-1)  
g(x) = 1/(x-1)
h(x) = g(x) - f(x)

plot(h,-10,10, xticks=false, xlims=(-13,13), ylims=(-13,13), 
    bottom_margin = 10mm, label=L"f(x) = \frac{1}{x-1} - \frac{1}{|x-1|}", framestyle = :zerolines, 
    legend=:outerright)

annotate!([(-8,-3.05, (L"dom(f)=\mathbb{R}", 10, :black))])
annotate!([(-8,-4.55, (L"codom(f)=\mathbb{R_{-}}", 10, :black))])
