using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f1(x) = 3 + abs(x-3)
               
plot(f1, 0, 4, ylims=(0,6),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)

plot!(f1,0,4, label="", fill=(0, 0.15, :green))