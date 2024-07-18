# https://jverzani.github.io/CalculusWithJuliaNotes.jl/precalc/inversefunctions.html#lines
using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia, SymPy # ignore any warnings 
gr()

@syms x
f(x) = exp(x)
c = 1
# tangent line formula y-y1 = m(x-x1) 
# you can use f'(1)
tl(x) = f(c) + f'(c) * (x - c)
xs = range(-5, 13, length=150)
ys = f.(xs)
zs = tl.(xs)

plot(xs, ys,  color=:blue, xlims=(-5,13), ylims=(-5,13), 
	label=L"y = e^{x}",framestyle=:zerolines)
plot!(xs, zs, color=:green, label="") # the tangent line
# fill with the lower boundary is tl(x) and 
# the upper boundary is a horizontal line defined by f

plot!(tl, 0,1, 
	fillrange = f(0.51), fillalpha = 0.25, c = 4, 
	label = "")
plot!(f, 0,4.5, 
	fillrange = 20, fillalpha = 0.2, c = 3, 
	label = "")
plot!(tl,0,5, label="", fill=(0, 0.15, :green))