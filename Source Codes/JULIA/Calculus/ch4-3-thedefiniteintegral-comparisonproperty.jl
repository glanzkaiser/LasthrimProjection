using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = 4 + log(x^2)/8 + cbrt(sin.(x))
g(x) = 2 + log(x^2)/8 + cos.(1.2x-2) 
               
plot(f, 1, 5.1, xticks=false, yticks=false, ylims=(0,6),
    label=L"y = g(x)", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot!(g, 1, 5.1, xticks=false, yticks=false, ylims=(0,6),
    label=L"y = f(x)", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot!(f,1,5.1, label=L"R_{2}", fill=(0, 0.25, :green))
plot!(g,1,5.1, label=L"R_{1}", fill=(0, 0.25, :blue))
annotate!([(1,-0.15, (L"a", 10, :black))])
annotate!([(5.1,-0.15, (L"b", 10, :black))])
