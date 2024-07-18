using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

function Area(f, a, b, n)
xs = a:(b-a)/n:b
deltas = diff(xs)
cs = xs[1:end-1]
sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

f(x) = 11 - 1.1x

plot(f, ylims= (0,12), xlims=(0,11), framestyle=:zerolines,
	legend=:outerright, bottom_margin=5mm, 
	label=L"f(t) = 11 - 1.1t", 
	size=(720, 360), tickfontsize=10)


plot!(f,3,5, label="", fill=(0, 0.45, :green))