using Plots, LaTeXStrings, ValidatedNumerics
gr()

f(x) = x^2

#plot(f, 0, 2, aspect_ratio=:equal, fill=(0, :green), alpha=0.2, label="")

function make_intervals(N=10)
    xs = range(0, stop=2, length=N+1)
    return [xs[i]..xs[i+1] for i in 1:length(xs)-1]
end

intervals = make_intervals()

# Plot Riemann Sums
intervals = make_intervals(6)
 
p = plot(aspect_ratio=:equal)
for X in intervals
    Y = f(X)

    plot!(IntervalBox(X, Interval(0, Y.hi)), c=:blue, label="", alpha=0.1)
end

plot!(f, 0, 2, xtick=false, xlims=(0,2),label=L"x^2")

annotate!([(1.2,1.07, (L"S_{n}", 11, :black))])
annotate!([(0.2,-0.07, (L"x_{0}", 6, :black))])
annotate!([(0.5,-0.07, (L"x_{1}", 6, :black))])
annotate!([(0.85,-0.07, (L"x_{2}", 6, :black))])
annotate!([(1.2,-0.07, (L"\dots", 6, :black))])
annotate!([(1.5,-0.07, (L"x_{n-1}", 6, :black))])
annotate!([(1.85,-0.07, (L"x_{n}", 6, :black))])
