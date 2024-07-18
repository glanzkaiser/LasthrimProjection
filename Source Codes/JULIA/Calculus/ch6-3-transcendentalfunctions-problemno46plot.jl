using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()
f(x) = exp(-x^2)

plot(f,-2,3; color=:blue, xlims=(-2,3), xtick=-2:1:3,ylims=(0,2), 
	framestyle=:zerolines, label=L"y = e^{-x^{2}}",
	top_margin=1mm, legend=:topright)
plot!([1,1],[0,f(1)], label="", linecolor=:black)

plot!(f,0,1, label="", fill=(0, 0.15, :blue))