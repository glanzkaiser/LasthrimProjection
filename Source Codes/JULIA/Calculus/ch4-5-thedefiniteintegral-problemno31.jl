using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

f(x) = 2/(1+x^2)

a, b = -1, 1

plot(f, a, b; ylims= (0,2), framestyle=:zerolines,
	legend=:outerright, label=L" f(x) = \frac{2}{1+x^{2}} ", 
	size=(720, 360), tickfontsize=10)

# first integral of f
#=
g = integrate(x -> 2/(1 + x^2))

plot!(g, a, b; ylims= (0,2000), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L" g(x) = \int \frac{2}{1+x^{2}} \ dx", 
	size=(720, 360), tickfontsize=10)
=#

# To calculate the integral at interval [-1,1]
#=
x = symbols("x")
f1 = integrate(2/(1+x^2), (x, -1, 1))
f1.evalf()

f2 = g(1)-g(-1)
f2.evalf()

# brings back as BigFloat, give more decimals than evalf
N(f1)
=#