using Plots, LaTeXStrings, MTH229
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = x+3
               
plot(f, -1, 3.5, ylims=(0,6),
    label=L"f(x) = x+3", framestyle=:zerolines,
     legend=:outerright)
plot!(f,-2,3, label="", fill=(0, 0.25, :blue))
annotate!([(0.77,0.95, ("A", 11, :black))])

# Calculate the integral with 50,000 partitions at interval [-2,3]
# riemann(f, -2, 3, 50_000)