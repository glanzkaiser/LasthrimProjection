using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

x₁, x₂, x₃ = 0,4,0
y₁, y₂, y₃ = 0,0,3

using Plots
xs = [x₁, x₂, x₃, x₁] # Vertices' x-component
ys = [y₁, y₂, y₃, y₁] # Vertices' y-component
plot(xs, ys, xaxis=false, yaxis=false, label="")

annotate!([(0.15,1.1, (L"3 \ ft", 10, :black))])
annotate!([(2,-0.2, (L"4 \ ft", 10, :black))])