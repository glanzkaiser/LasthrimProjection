using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

a, b = 0.01, 20

f(x) = cos(log(x))
g(x) = -sin(log(x))/x

p3 = plot(f, 0.01, 0.1; ylims= (-1,1), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = \cos(\ln (x)) ", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)

p1 = plot(f, a, b; ylims= (-1,1), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = \cos(\ln (x)) ", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)
p2 = plot(g, a, b; ylims= (-1,1), framestyle=:zerolines,
	legend=:topright, label=L" f'(x) = \frac{- \sin(\ln (x) )}{x} ", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)

plot(p3, p1, p2, layout = (3, 1), legend=:outerright,
     xaxis = "x", yaxis = "y")