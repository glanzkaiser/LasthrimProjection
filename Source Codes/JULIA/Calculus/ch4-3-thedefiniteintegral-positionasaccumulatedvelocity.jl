using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = x/20
g(x) = 2
h(x) = 5 - x/20
               
plot(f, 0, 40, ylims=(-3,2),
    label=L"v(t) = t/20", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot!(g, 40, 60, ylims=(-3,2),
    label=L"v(t) = 2", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot!(h, 60, 160, ylims=(-3,2),
    label=L"v(t) = 5 - t/20", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)

plot!(f,0,40, label="", fill=(0, 0.15, :green))
plot!(g,40,60, label="", fill=(0, 0.15, :green))
plot!(h,60,100, label="", fill=(0, 0.15, :green))
plot!(h,100,160, label="", fill=(0, 0.15, :blue))
