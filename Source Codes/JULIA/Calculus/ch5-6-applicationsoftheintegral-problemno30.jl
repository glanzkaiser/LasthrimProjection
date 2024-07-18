using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

x₁, x₂, x₃ = 0,3,1.2
y₁, y₂, y₃ = 0,0,1


using Plots
xs = [x₁, x₂, x₃, x₁] # Vertices' x-component
ys = [y₁, y₂, y₃, y₁] # Vertices' y-component
plot(xs, ys, xlims=(0,5), ylims=(0,2), 
	xaxis=true, yaxis=true, xtick=false, ytick=false, 
	bottom_margin=10mm, left_margin=10mm, label="")

annotate!([(-0.2,1, (L"h", 10, :black))])
annotate!([(0,1, (L"-", 10, :black))])
annotate!([(-0.2,1.6, (L"k", 10, :black))])
annotate!([(0,1.6, (L"-", 10, :black))])
annotate!([(3,-0.15, (L"b", 10, :black))])
annotate!([(3,0, (L"|", 10, :black))])
