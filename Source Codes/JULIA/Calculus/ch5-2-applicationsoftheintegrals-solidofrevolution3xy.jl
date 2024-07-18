using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

# For the curve
f(x) = x^3 + 2

# Plotting time

plot(f, ylims= (0,13), xlims=(0,5), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = x^{3} + 2", 
	size=(720, 360), tickfontsize=10)

# First filling
plot!(f, 0,4.5, 
	fillrange = 20, fillalpha = 0.35, c = 1, 
	label = "")

# Second filling
# Fill from x=1.1 to x=1.37 with lower bound will be f and the height is fillrange
plot!(f,1.1,1.37, 
	fillrange = 4.8, fillalpha = 0.65, c = 1, 
	label = "")

# Fill from (0,f(1.1) to (1.1,f(1.1))
# with the height is fillrange
plot!([0,1.1], [f(1.1), f(1.1)], 
	fillrange = f(1.41), fillalpha = 0.65, c = 1, 
	label = "", linewidth = 0)

#=
# Calculate the area 
a,b = 1, oo
@syms x

A = integrate(x^3 + 2, (x, a, b))

# Calculate the Volume
rad(x) = x^3 + 2
V = integrate(pi*(rad(x)), (x, a, b))
=#