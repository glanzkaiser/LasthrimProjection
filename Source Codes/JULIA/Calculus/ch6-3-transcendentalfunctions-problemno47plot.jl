using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()
f(x) = exp(-x)

plot(f,-2,3; color=:blue, xlims=(-2,3), xtick=-2:1:3,ylims=(0,2), 
	framestyle=:zerolines, label=L"y = e^{-x}",
	top_margin=1mm, legend=:topright)
plot!([0,1],[1,1/exp(1)], label="", linecolor=:black)

plot!([0,1],[1,1/exp(1)],
	fillrange = f(1), label="Area",fillalpha = 0.2, c = 1)
plot!(f,0,4, label="", fill=(0, 0.33, :blue))