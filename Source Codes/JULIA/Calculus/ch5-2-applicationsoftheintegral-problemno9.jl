using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

# For the curve
f(x) = 9 - x^2

# Plotting time

plot(f, ylims= (0,10), xlims=(-5,5), 
	ytick=true, xtick=true, framestyle=:zerolines,
	legend=:topright, bottom_margin=5mm, 
	label=L"f(x) = 9 - x^{2}", 
	size=(720, 360), tickfontsize=10)

plot!(f,-3,3, label="", fill=(0, 0.15, :blue))
plot!(f,0.8,1.3, label="", fill=(0, 0.35, :blue))

=#
#=
# Calculate the area 
a,b = -3, 3
@syms x

A = integrate(9 - x^2, (x, a, b))

# Calculate the Volume
rad(x) = 9 - x^2
V = integrate(pi*(rad(x)), (x, a, b))
=#