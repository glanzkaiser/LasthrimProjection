using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = 1/x

plot(f,0,4; color=:blue, xlims=(0,4), xtick=0:1:4, ylims=(-1,4), 
	framestyle=:zerolines, label=L"y= \frac{1}{x}",legend=true)
plot!(f,1,e, label="", fill=(0, 0.15, :blue))

annotate!([(e,0, (L"|", 10, :black))])
annotate!([(e,-0.3, (L"e", 8, :black))])
