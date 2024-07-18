using Plots,  LaTeXStrings
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = x^2
Area(x -> x^2, 0, 1, 50_000)

plot(f,0,2.3, label=L"y = x^2", legend=:outertop)
plot!(f,0,2, label="", fill=(0, 0.35, :blue))
plot!([2,2],[0,f(2)], label="", linecolor=:green)
annotate!([(1.77,1.95, ("R", 11, :black))])