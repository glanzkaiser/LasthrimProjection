using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

f(x) = sin(x^2)
a, b = 0, 2

function riemann(f::Function, a::Real, b::Real, n::Int; method="right")
    if method == "right"
        meth = f -> (lr -> begin l,r = lr; f(r) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "left"
        meth = f -> (lr -> begin l,r = lr; f(l) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "trapezoid"
        meth = f -> (lr -> begin l,r = lr; (1/2) * (f(l) + f(r)) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "simpsons"
        meth = f -> (lr -> begin l,r = lr; (1/6) * (f(l) + 4*(f((l+r)/2)) + f(r)) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "midpoint"
	xs = a:(b-a)/n:b
        deltas = diff(xs)      # forms x2-x1, x3-x2, ..., xn-xn-1
        cs = [(xs[i] + xs[i+1])/2 for i in 1:length(deltas)]
        sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
    end
end

# We will approximate for area under the curve between 0 and 2 / interval of [0,2]
# Using a Riemann sum with 8 equal subintervals  / partitions
# First, we will plot the function
plot(f, a, b; xlims= (-6,6), ylims= (-2,2), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = \sin(x^{2})", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)

# Type at Julia REPL
# For Left Riemann Sums, Right Riemann Sums, Midpoint Riemann Sums
# Trapezoid Rule, and Simpsons' Rule
# with interval on [0,2] and partitions = 8
# The last line is for calculating integral with analytical method
#=
riemann(f, 0, 2, 8, method="left")
riemann(f, 0, 2, 8, method="right")
riemann(f, 0, 2, 8, method="midpoint")
riemann(f, 0, 2, 8, method="trapezoid")
riemann(f, 0, 2, 8, method="simpsons")
integrate(f,0,2).evalf()
=#
