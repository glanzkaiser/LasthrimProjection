using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = 1/(1+exp(1/x))
g(x) = f'(x)

plot(f,-20,20; color=:blue, xlims=(-20,20), xtick=-20:20:20,ylims=(-0.1,1.2), 
	framestyle=:zerolines, label=L"y = \frac{1}{1+e^{1/x}}",
	top_margin=1mm, legend=:topright)

plot!(g,-20,20; color=:green, xlims=(-20,20), xtick=-20:20:20,ylims=(-0.1,1.2), 
	framestyle=:zerolines, label=L"y = \frac{e^{1/x}}{x^{2}(1+e^{1/x})^{2}}",
	top_margin=1mm, legend=:topright)
