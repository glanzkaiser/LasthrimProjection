using Plots, LaTeXStrings, ValidatedNumerics, Plots.PlotMeasures
gr()

f(x) = 1/x

function make_intervals(N=2)
    xs = range(1, stop=3, length=N+1)
    return [xs[i]..xs[i+1] for i in 1:length(xs)-1]
end

function make_intervals2(N=1)
    xs = range(6, stop=7, length=N+1)
    return [xs[i]..xs[i+1] for i in 1:length(xs)-1]
end

# Plot Riemann Sums
intervals = make_intervals(2) 
intervals2 = make_intervals2(1) 

plot(f, 1, 8, xtick=false, xlims=(0,8),ylims=(0,2),label=L"y = \frac{1}{x}",
	bottom_margin=10mm)

for X in intervals
    Y = f(X)
    plot!(IntervalBox(X, Interval(0, Y.lo)), c=:blue, label="", alpha=0.1)
    plot!(IntervalBox(X, Interval(0, Y.hi)), c=:green, label="", alpha=0.1)
end

for X in intervals2
    Y = f(X)
    plot!(IntervalBox(X, Interval(0, Y.lo)), c=:blue, label="", alpha=0.1)
    plot!(IntervalBox(X, Interval(0, Y.hi)), c=:green, label="", alpha=0.1)
end

annotate!([(1,-0.07, (L"1", 6, :black))])
annotate!([(2,-0.07, (L"2", 6, :black))])
annotate!([(3,-0.07, (L"3", 6, :black))])
annotate!([(6,-0.07, (L"n-1", 6, :black))])
annotate!([(7,-0.07, (L"n", 6, :black))])

annotate!([(1,1.1, (L"(1,1)", 6, :black))])
annotate!([(2.1,0.6, (L"(2,\frac{1}{2})", 6, :black))])
annotate!([(3.2,0.37, (L"(3,\frac{1}{3})", 6, :black))])
annotate!([(6.2,0.23, (L"(n-1,\frac{1}{n-1})", 6, :black))])
annotate!([(7.2,0.23, (L"(n,\frac{1}{n})", 6, :black))])

scatter!([1], [f(1)], color = "blue1", label="", markersize = 3)
scatter!([2], [f(2)], color = "blue1", label="", markersize = 3)
scatter!([3], [f(3)], color = "blue1", label="", markersize = 3)
scatter!([6], [f(6)], color = "blue1", label="", markersize = 3)
scatter!([7], [f(7)], color = "blue1", label="", markersize = 3)
