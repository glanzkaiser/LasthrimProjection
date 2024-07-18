using Plots, LaTeXStrings; gr()

# To plot a circle of radius 2 centered at (0, 0) 
θ = 0:0.1:2.1π
x = 0 .+ 2cos.(θ)
y = 0 .+ 2sin.(θ)
plot(x, y, label=L"x^{2} + y^{2} = r^{2}",
	framestyle=:zerolines, aspect_ratio=:equal)

plot!(Plots.partialcircle(0,1//3*pi,100,0.42), label="",color=:blue, arrow=true)
plot!([0,2cos.(1)],[0,2sin.(1)], label="", linecolor=:green)
scatter!([0,2cos.(1)], [0,2sin.(1)], color = "blue1", label="", markersize = 3)

annotate!([(0.66,0.8, (L"a", 10, :blue))])
annotate!([(0.46,0.2, (L"t", 10, :blue))])
annotate!([(1.47,1.7, (L"(x,y)", 10, :blue))])
