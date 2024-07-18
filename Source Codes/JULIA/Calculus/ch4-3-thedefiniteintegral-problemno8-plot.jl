using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f1(x) = x
f2(x) = -x + 2
f3(x) = x - 2
f4(x) = -x + 4
f5(x) = x - 4
               
plot(f1, 0, 1, ylims=(-3,2),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot(f2, 1, 2, ylims=(-3,2),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot(f3, 2, 3, ylims=(-3,2),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot(f4, 3, 4, ylims=(-3,2),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot(f5, 4, 5, ylims=(-3,2),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)

plot!(f1,0,1, label="", fill=(0, 0.15, :green))
plot!(f2,1,2, label="", fill=(0, 0.15, :green))
plot!(f3,2,3, label="", fill=(0, 0.15, :green))
plot!(f4,3,4, label="", fill=(0, 0.15, :green))
plot!(f5,4,4.5, label="", fill=(0, 0.15, :green))

annotate!([(4.5,-0.15, (L"x", 10, :black))])