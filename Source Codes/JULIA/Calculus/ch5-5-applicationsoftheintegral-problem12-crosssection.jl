using Plots; plotlyjs()

# To plot half circle of radius 3 centered at (0, 0) 
θ = π:0.01:2π
x = 0 .+ 3cos.(θ)
y = 0 .+ 3sin.(θ)
plot(x, y, xaxis=false, yaxis=false, label="", linecolor=:blue2)
annotate!([(0,-0.14, ("6 ft", 10, :black))])
plot!([3,-3],[0,0], label="", linecolor=:black)


