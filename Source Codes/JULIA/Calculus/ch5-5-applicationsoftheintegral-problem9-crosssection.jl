using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

x₁, x₂, x₃ = 0,4,2
y₁, y₂, y₃ = 0,0,5

using Plots
xs = [x₁, x₂, x₃, x₁] # Vertices' x-component
ys = [y₁, y₂, y₃, y₁] # Vertices' y-component
plot(xs, ys, xaxis=false, yaxis=false, label="")

annotate!([(2.2,2.1, (L"5 \ ft", 10, :black))])
annotate!([(2,-0.2, (L"4 \ ft", 10, :black))])
plot!([2,2],[0,5], label="", linecolor=:green, linestyle=:dash)
