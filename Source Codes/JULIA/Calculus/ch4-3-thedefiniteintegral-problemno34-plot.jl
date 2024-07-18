using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f1(x) = 1
f2(x) = x
f3(x) = 4 - x
               
plot(f1, 0, 1, ylims=(0,5),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot(f2, 1, 2, ylims=(0,5),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot(f3, 2, 4, ylims=(0,5),
    label="", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outerright)

plot!(f1,0,1, label="", fill=(0, 0.15, :green))
plot!(f2,1,2, label="", fill=(0, 0.15, :green))
plot!(f3,2,4, label="", fill=(0, 0.15, :green))

#annotate!([(4.5,-0.15, (L"x", 10, :black))])