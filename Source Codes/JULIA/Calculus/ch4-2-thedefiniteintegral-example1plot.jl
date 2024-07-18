using Plots, LaTeXStrings, ValidatedNumerics, Plots.PlotMeasures
gr()

f(x) = x^3 - 5x^2 + 2x + 8
	
function make_intervals(N=5)
    xs = range(0, stop=5, length=N+1)
    return [[xs[i],xs[i+1]] for i in 1:length(xs)-1]
end
	
# Plot Riemann Sums
intervals = make_intervals(5)
p = plot()
for X in intervals
    Y = f.(X)
	box = IntervalBox([X[1],0],[X[2],(Y[1]+Y[2])/1.8],)
	plot!(box,c=:blue,legend=nothing,alpha=.3)
end
plot!(f, 0, 5, xlims=(0, 5), ylims=(-6,18), 
	label="",
	c=:red)

plot!([0.5,0.5],[0,f(0.5)], label="", linecolor=:green, linestyle=:dot)
plot!([1.5,1.5],[0,f(1.5)], label="", linecolor=:green, linestyle=:dot)
plot!([2.4,2.4],[0,f(2.4)], label="", linecolor=:green, linestyle=:dot)
plot!([3.7,3.7],[0,f(3.7)], label="", linecolor=:green, linestyle=:dot)