using Plots, LaTeXStrings, Plots.PlotMeasures 
gr()

f(x) = log(x)
g(x) = exp(x)
h(x) = x

plot(f,-5,5; color=:blue, xlims=(-5,5), xtick=-5:1:5, ylims=(-4,4), 
	framestyle=:zerolines, label=L"y=\ln (x)",legend=true)
plot!(g,-5,5; color=:green, xlims=(-5,5), xtick=-5:1:5, ylims=(-4,4), 
	framestyle=:zerolines, label=L"y= \exp (x)",legend=true)
plot!(h,-5,5; color=:black, xlims=(-5,5), xtick=-5:1:5, ylims=(-4,4), 
	framestyle=:zerolines, label=L"y=x",legend=true)
