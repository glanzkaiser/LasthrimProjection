using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

x₁, x₂, x₃ = 3,3,7
y₁, y₂, y₃ = 4,8,4

using Plots
xs = [x₁, x₂, x₃, x₁] # Vertices' x-component
ys = [y₁, y₂, y₃, y₁] # Vertices' y-component
plot(xs, ys, xaxis=false, yaxis=false, label="")

annotate!([(5.1,6.1, (L"ds", 10, :black))])
annotate!([(2.8,6, (L"dy", 10, :black))])
annotate!([(4.7,3.7, (L"dx", 10, :black))])