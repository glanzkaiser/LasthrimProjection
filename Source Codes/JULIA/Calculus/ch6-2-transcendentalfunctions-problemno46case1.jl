using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

f(x) = sin(3x^3+80) + tan(0.8cbrt(x)) + 1

plot(f,0,1; color=:blue, xlims=(-1,3), xtick=-1:1:3, ylims=(-1,4), 
	framestyle=:zerolines, label=L"y=f(x)",legend=true)

plot!([0.6,0.6],[0,f(0.6)], label="", linecolor=:green)
plot!([0,0.97],[f(0.97),f(0.97)], label="", linecolor=:green)
plot!([0.6,0.6],[f(0.97),f(0.6)], label="", linecolor=:green, linestyle=:dash)

annotate!([(0.41,0.3, (L"\int_{0}^{a} f(x) \ dx", 8, :black))])
annotate!([(0.3,1.6, (L"\int_{0}^{b} f^{-1} (y) \ dy", 8, :black))])
annotate!([(0.6,-0.2, (L"a", 8, :black))])
annotate!([(-0.1,f(0.97), (L"b", 8, :black))])
