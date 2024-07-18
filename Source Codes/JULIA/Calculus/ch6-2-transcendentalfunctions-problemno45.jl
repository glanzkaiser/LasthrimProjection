using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

plot([0,0.9],[0,0.8], xlims=(0,1.2), xtick=0:1:2, ylims=(0,1.4), label="", linecolor=:green)
plot!([0.9,1],[0.8,1], label="", linecolor=:green)

plot!([0,1],[1,1], label="", linecolor=:black)
plot!([1,1],[0,1], label="", linecolor=:black)

annotate!([(0.6,0.4, (L"A", 10, :black))])
annotate!([(0.6,0.84, (L"B", 10, :black))])