using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f1(x) = log(abs(x))
f2(x) = log(sqrt(x))
f3(x) = log(1/x)
f4(x) = log(x-2)

p1 = plot(f1,-5,5, xtick=-5:1:5, xlims=(-5,5), ylims=(-5,5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \ln |x|", legend=:topright)
p2 = plot(f2,-5,5, xtick=-5:1:5, xlims=(-5,5), ylims=(-5,5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \ln \sqrt{x}", legend=:topright)
p3 = plot(f3,-5,5, xtick=-5:1:5, xlims=(-5,5), ylims=(-5,5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \ln (\frac{1}{x})", legend=:topright)
p4 = plot(f4,-5,5, xtick=-5:1:5, xlims=(-5,5), ylims=(-5,5), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"y = \ln (x-2)", legend=:topright)

plot(p1, p2, p3, p4, layout = (2, 2), legend=:outerright,
     xaxis = "x", yaxis = "y")