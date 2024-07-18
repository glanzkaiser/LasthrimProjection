using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

f(x) = sqrt(4-x)
a, b = 1, 3

function riemann(f, a, b, n; method="left")
  xs = a:(b-a)/n:b
  deltas = diff(xs)      # forms x2-x1, x3-x2, ..., xn-xn-1
  if method == "left"
    cs = xs[1:end-1]
  elseif method == "right"
    cs = xs[2:end]
  elseif method == "midpoint"
    cs = [(xs[i] + xs[i+1])/2 for i in 1:length(deltas)]
  end
  sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end


# We will approximate for area under the curve between 1 and 3 / interval of [1,3]
# Using a Riemann sum with 4 equal subintervals 

plot(f, a, b; xlims= (0,4), ylims= (0,4), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = \sqrt{4-x}", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)

# Type at Julia REPL
# For Left Riemann Sums, Right Riemann Sums, and Midpoint Riemann Sums
# For calculating integral with analytical method
#=
riemann(f, 1, 3, 4, method="left")
riemann(f, 1, 3, 4, method="right")
riemann(f, 1, 3, 4, method="midpoint")
integrate(f,1,3).evalf()
=#
