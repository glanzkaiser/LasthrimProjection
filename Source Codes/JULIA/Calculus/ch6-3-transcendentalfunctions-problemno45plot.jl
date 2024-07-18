using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()
f(x) = exp(x)

plot(f,-6,3; color=:blue, xlims=(-6,3), xtick=-6:1:3, yaxis=false,ylims=(-2,8), 
	framestyle=:zerolines, label=L"y = e^{x}",
	top_margin=1mm, legend=:topright)
plot!([log(3),log(3)],[0,f(log(3))], label="", linecolor=:black)

plot!(f,0,log(3), label="", fill=(0, 0.15, :blue))