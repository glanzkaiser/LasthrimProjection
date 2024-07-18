# m is a local minimum
using Plots, LaTeXStrings, Plots.PlotMeasures
f(x) = 0.1

plot([0.3,0.9],[0,0],arrow=true,color=:black,linewidth=2, 
xticks=false, yticks=false,
ylims=(0,1), showaxis=false, label="", bottom_margin = 10mm)

annotate!([(0.35,0, (L"|", 12, :black))])
annotate!([(0.4,0, (L"|", 12, :black))])
annotate!([(0.45,0, (L"|", 12, :black))])
annotate!([(0.55,0, (L"|", 12, :black))])
annotate!([(0.6,0, (L"|", 12, :black))])
annotate!([(0.8,0, (L"|", 12, :black))])
annotate!([(0.85,0, (L"|", 12, :black))])

annotate!([(0.576,0.1, (L") \ ) \ )", 8, :blue))])
annotate!([(0.35,-0.1, (L"a", 10, :black))])
annotate!([(0.4,-0.1, (L"x_{1}", 10, :black))])
annotate!([(0.45,-0.1, (L"x_{2}", 10, :black))])
annotate!([(0.5,-0.1, (L"\dots", 10, :black))])
annotate!([(0.65,-0.1, (L"\dots", 10, :black))])

annotate!([(0.55,-0.1, (L"x_{i-1}", 10, :black))])
annotate!([(0.6,-0.1, (L"x_{i}", 10, :black))])

annotate!([(0.8,-0.1, (L"x_{n-1}", 10, :black))])
annotate!([(0.85,-0.1, (L"b", 10, :black))])

annotate!([(0.55,0.1, (L"O", 10, :blue))])
annotate!([(0.6,0.1, (L"O", 10, :blue))])
