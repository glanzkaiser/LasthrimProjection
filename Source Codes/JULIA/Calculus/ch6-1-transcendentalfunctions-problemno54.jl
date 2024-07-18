using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

@syms x

f1(x) = (x^2 / 4) - log(sqrt(x))
a,b = 1, 2
a1(x) = diff(f1(x),x)
g1(x) = sqrt(1 + (a1(x))^2)
V1 = integrate((g1(x)), (x, a, b))

plot(f1,0,3, xtick=0:1:3, xlims=(0,3), ylims=(-0.25,1), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \frac{x^{2}}{4} - \ln \sqrt{x}", legend=:topleft)

annotate!([(1.2,0.21, ("length: ", 8, :black))])
annotate!([(1.7,0.21, (V1.evalf(), 8, :black))])

plot!(f1,1,2,color=:green, label="")