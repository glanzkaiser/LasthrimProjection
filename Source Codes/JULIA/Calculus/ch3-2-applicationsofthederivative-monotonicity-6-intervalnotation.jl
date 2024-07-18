using Plots, LaTeXStrings, Plots.PlotMeasures

f(x) = 0.1
plot([0.3,0.9],[0,0],arrow=true,color=:black,linewidth=2, xticks=false, yticks=false,
ylims=(0,1), showaxis=false, label="", bottom_margin = 10mm)
#plot!(f,0.55,0.7, fill=(0, 0.2, :green), label="")

annotate!([(0.4,0, (L"|", 17, :black))])
annotate!([(0.4,-0.1, (L"-1", 10, :black))])
annotate!([(0.6,0, (L"|", 17, :black))])
annotate!([(0.6,-0.1, (L"1", 10, :black))])
annotate!([(0.4,0.1, (L"0", 10, :black))])
annotate!([(0.6,0.1, (L"0", 10, :black))])
annotate!([(0.35,0.1, (L"-", 10, :red))])
annotate!([(0.5,0.1, (L"+", 10, :black))])
annotate!([(0.65,0.1, (L"-", 10, :red))])
annotate!([(0.35,0.2, (L"g'(x)", 12, :black))])

# for g''
#=
using Plots, LaTeXStrings, Plots.PlotMeasures

f(x) = 0.1
plot([0.3,0.9],[0,0],arrow=true,color=:black,linewidth=2, xticks=false, yticks=false,
ylims=(0,1), showaxis=false, label="", bottom_margin = 10mm)
#plot!(f,0.55,0.7, fill=(0, 0.2, :green), label="")

annotate!([(0.4,0, (L"|", 17, :black))])
annotate!([(0.4,-0.1, (L"- \sqrt{3}", 10, :black))])
annotate!([(0.6,0, (L"|", 17, :black))])
annotate!([(0.6,-0.1, (L"0", 10, :black))])
annotate!([(0.8,0, (L"|", 17, :black))])
annotate!([(0.8,-0.1, (L"\sqrt{3}", 10, :black))])
annotate!([(0.6,0.1, (L"0", 10, :black))])
annotate!([(0.35,0.1, (L"-", 10, :red))])
annotate!([(0.5,0.1, (L"+", 10, :black))])
annotate!([(0.7,0.1, (L"-", 10, :red))])
annotate!([(0.85,0.1, (L"+", 10, :black))])
annotate!([(0.35,0.2, (L"g''(x)", 12, :black))])

=#