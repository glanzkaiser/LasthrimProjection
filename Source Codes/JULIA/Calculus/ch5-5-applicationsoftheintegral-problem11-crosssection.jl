using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

x₁, x₂, x₃, x₄ = 1.5,4.5,6,0
y₁, y₂, y₃, y₄ = 0,0,4,4


using Plots
xs = [x₁, x₂, x₃, x₄, x₁] # Vertices' x-component
ys = [y₁, y₂, y₃, y₄, y₁] # Vertices' y-component
plot(xs, ys, xaxis=false, yaxis=false, label="")

annotate!([(1.73,2, (L"4 \ ft", 10, :black))])
annotate!([(3,3.8, (L"6 \ ft", 10, :black))])
annotate!([(3,0.2, (L"3 \ ft", 10, :black))])
plot!([1.5,1.5],[0,4], label="", linecolor=:green, linestyle=:dash)
