using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

f(x) = 1/x

plot(f,0,6, xtick=0:2:6, xlims=(0,4), ylims=(0,10), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \frac{1}{x}", legend=:topright)

plot!(f,1,6, label="", fill=(0, 0.15, :blue))


#=
# Calculate the area 
a,b = 1, oo
@syms x

A = integrate(1/x, (x, a, b))

# Calculate the Volume
rad(x) = 1/x
V = integrate(pi*(rad(x)), (x, a, b))
=#