using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

# For the curve
f(x) = sqrt(9 - x^2)

# Plotting time

plot(f, ylims= (0,4), xlims=(0,4), 
	ytick=false, xtick=false, framestyle=:zerolines,
	legend=:topright, left_margin=5mm, bottom_margin=5mm, 
	label=L"x^{2} + y^{2} = r^{2}", 
	size=(720, 360), tickfontsize=10)

plot!(f,-3,3, label="", fill=(0, 0.15, :blue))
plot!(f,1.8,3, label="", fill=(0, 0.35, :blue))

annotate!([(3,-0.2, (L"r", 10, :black))])
annotate!([(-0.1,3, (L"r", 10, :black))])
annotate!([(1.73,-0.2, (L"r-h", 10, :black))])

#=
# Calculate the volume with symbolics at interval [r-h,r]

@syms x, r, h

f1(x) = r^2 - x^2
V = integrate(pi*(f1(x)), (x, r-h, r))
V.evalf()
d = simplify(V)
=#

