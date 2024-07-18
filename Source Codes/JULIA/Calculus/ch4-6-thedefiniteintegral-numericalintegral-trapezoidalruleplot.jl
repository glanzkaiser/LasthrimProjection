using Plots, LaTeXStrings, ValidatedNumerics, Plots.PlotMeasures
gr()

f(x) = sin(x^2) - cos(2x) + 8

function make_intervals(N=8)
    xs = range(0, stop=3, length=N+1)
    return [xs[i]..xs[i+1] for i in 1:length(xs)-1]
end

# Plot Riemann Sums
intervals = make_intervals(8)
 
p = plot()
for X in intervals
    x = [X.lo, X.hi, X.hi, X.lo]
    y = [0, 0, f(X.hi), f(X.lo)]
    plot!(Shape(x, y), c=:blue, label="", alpha=0.1)
end

plot!(f, xlims=(-1,3), xtick=:false, ylims=(0,11), dpi=600,
	size=(360,400), label=L"\sin(x^{2})\ - \cos(2x) + 8",
	bottom_margin=5mm)

annotate!([(0,-0.3, (L"a=x_{0}", 6, :blue))])
annotate!([(0.4,-0.3, (L"x_{1}", 6, :blue))])
annotate!([(0.8,-0.3, (L"x_{2}", 6, :blue))])
annotate!([(1.2,-0.3, (L"\dots", 6, :blue))])
annotate!([(2.2,-0.3, (L"x_{n-2}", 6, :blue))])
annotate!([(2.6,-0.3, (L"x_{n-1}", 6, :blue))])
annotate!([(3,-0.3, (L"x_{n} = b", 6, :blue))])

annotate!([(-0.23,3.3, (L"f(x_{0})", 6, :blue))])
annotate!([(0.4,3.3, (L"f(x_{1})", 6, :blue))])
annotate!([(0.8,3.3, (L"f(x_{2})", 6, :blue))])
annotate!([(2.2,3.7, (L"f(x_{n-2})", 6, :blue))])
annotate!([(2.6,3.3, (L"f(x_{n-1})", 6, :blue))])
annotate!([(3.1,3.3, (L"f(x_{n})", 6, :blue))])
