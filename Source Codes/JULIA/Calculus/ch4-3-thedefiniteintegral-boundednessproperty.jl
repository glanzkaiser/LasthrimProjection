using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = 4 + log(x^2)/8 + cbrt(sin.(x))
g(x) = 2
               
plot(f, 1, 5.1, xticks=false, yticks=false, ylims=(0,6),
    label=L"y = f(x) = 4 + \frac{log(x^{2})}{8} + (\sin(x))^{1/3}", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot!(f,1,5.1, label=L"A(x)", fill=(0, 0.25, :green))
plot!(g,1,5.1, label=L"B(x)", fill=(0, 0.25, :blue))
annotate!([(1,-0.15, (L"a", 10, :black))])
annotate!([(5.1,-0.15, (L"b", 10, :black))])
annotate!([(-0.3,2, (L"m", 10, :black))])
annotate!([(-0.3,f(1.5), (L"M", 10, :black))])
annotate!([(0,2, (L"-", 10, :black))])
annotate!([(0,f(1.5), (L"-", 10, :black))])

plot!([1,5.1],[f(1.8),f(1.8)], label="", linecolor=:green)
plot!([1,1],[2,f(1.8)], label="", linecolor=:green)
plot!([5.1,5.1],[2,f(1.8)], label="", linecolor=:green)
