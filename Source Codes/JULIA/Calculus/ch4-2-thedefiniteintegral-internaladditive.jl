using Plots, LaTeXStrings, MTH229
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = x^2 - log(x/2) + 3
               
plot(f, -1, 6, ylims=(-8,20),
    label=L"f(x) = x^{2} \log(x/2) + 3", framestyle=:zerolines,
     legend=:outerright)
plot!(f,0.5,2, label="", fill=(0, 0.25, :blue))
plot!(f,2,3.5, label="", fill=(0, 0.5, :blue))

annotate!([(0.97,1.95, (L"R_{1}", 11, :black))])
annotate!([(2.85,1.95, (L"R_{2}", 11, :black))])
annotate!([(0.6,0, (L"|", 11, :black))])
annotate!([(2.1,0, (L"|", 11, :black))])
annotate!([(3.6,0, (L"|", 11, :black))])
annotate!([(0.5,-1.2, (L"a", 11, :black))])
annotate!([(2,-1.2, (L"b", 11, :black))])
annotate!([(3.5,-1.2, (L"c", 11, :black))])

# Calculate the integral with 50,000 partitions at interval [-1,3]
# riemann(f, -2, 3, 50_000)