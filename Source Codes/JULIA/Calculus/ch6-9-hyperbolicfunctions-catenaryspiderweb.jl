# Catenary example: spider' web
using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()
@syms x

a, b = -6π, 6π

y(x) = 2cosh(x/2)

xs1 = range(a, b, length=150)

plot(xs1, y, color=:red, 
	xlims=(-6π,6π), ylims=(-π,6π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"y = a \ \cosh \frac{x}{a}", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)


for N in 1:2:6
     display(plot!(xs1,2*cosh(x/2) + N, label=""))
     display(plot!(xs1,2*cosh(x/2) - N, label=""))
     display(plot!(xs1,2*cosh((x-13)/2) - N, label=""))
     display(plot!(xs1,2*cosh((x-13)/2) + N, label=""))
     display(plot!(xs1,2*cosh((x+13)/2) - N, label=""))
     display(plot!(xs1,2*cosh((x+13)/2) + N, label=""))
end

#=
for N in 3:1:5
     display(plot!(xs1,N*cosh(x/N), label=L"a = %$N "))
end
=#