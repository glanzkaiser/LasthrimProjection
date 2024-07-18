using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

f(x) = cbrt(x - 2) 

plot(f,0,20, xtick=0:5:20, xlims=(0,20), ylims=(0,5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \sqrt[3]{x - 2}", legend=:topright)

plot!(f,0,20, label="", fill=(0, 0.15, :blue))

plot!(f,5,6.3, label="", fill=(0, 0.55, :blue))

#=
# Calculate the area 
a,b = 1, oo
@syms x

A = integrate(cbrt(x-2), (x, a, b))

# Calculate the Volume
rad(x) = cbrt(x-2)
V = integrate(pi*(rad(x)), (x, a, b))
=#