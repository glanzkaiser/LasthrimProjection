using Plots, LaTeXStrings, MTH229, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = x^2
               
plot(f, 0, 6, ylims=(0,6),
    label=L"y = f(t) = t^{2}", 
    bottom_margin=3mm, framestyle=:zerolines,
    legend=:outerright)
plot!(f,0,1.7, label=L"B(x)", fill=(0, 0.25, :blue))
annotate!([(1.7,-0.15, (L"x", 10, :black))])

# Calculate the integral with 50,000 partitions at interval [-2,3]
# riemann(f, -2, 3, 50_000)