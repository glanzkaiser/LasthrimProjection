using Plots, LaTeXStrings, ValidatedNumerics, Plots.PlotMeasures
gr()

f(x) = 3x^2 + x + 1

function make_intervals(N=10)
    xs = range(-1, stop=1, length=N+1)
    return [xs[i]..xs[i+1] for i in 1:length(xs)-1]
end

# Plot Riemann Sums
intervals = make_intervals(10)
 
p = plot(aspect_ratio=:equal)
for X in intervals
    Y = f(X)

    plot!(IntervalBox(X, Interval(0, Y.hi)), c=:blue, label="", alpha=0.1)
end

plot!(f, -1, 1, xtick=-1:1:1, xlims=(-1,1),label=L"3x^2 + x + 1",
	bottom_margin=5mm)

annotate!([(-0.9,-0.07, (L"x_{0}", 6, :black))])
annotate!([(-0.7,-0.07, (L"x_{1}", 6, :black))])
annotate!([(-0.5,-0.07, (L"x_{2}", 6, :black))])
annotate!([(0,-0.07, (L"\dots", 6, :black))])
annotate!([(0.77,-0.07, (L"x_{n-1}", 6, :black))])
annotate!([(1.07,-0.07, (L"x_{n}", 6, :black))])
