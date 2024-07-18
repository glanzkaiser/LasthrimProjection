using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

f(x) = (1+1/x)^5

a, b = 10, 20

plot(f, a, b; ylims= (0,2), framestyle=:zerolines,
	legend=:outerright, label=L" f(x) = (1 + \frac{1}{x})^{5} ", 
	size=(720, 360), tickfontsize=10)

# first integral of f
#=
g = integrate(x -> (1+1/x)^5)

plot!(g, a, b; ylims= (0,2000), xtick=pitick(a, b, 1; mode=:latex), framestyle=:zerolines,
	legend=:outerright, label=L" g(x) = \int (1+\frac{1}{x})^{5} \ dx", 
	size=(720, 360), tickfontsize=10)
=#

# To calculate the integral at interval [-1,1]
#=
x = symbols("x")
f1 = integrate((1+1/x)^5, (x, 10, 20))
f1.evalf()

f2 = g(20)-g(10)
f2.evalf()

# brings back as BigFloat, give more decimals than evalf
N(f1)
=#