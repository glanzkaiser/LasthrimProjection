using Plots; plotlyjs()

# To plot a circle of radius 2 centered at (1, 1) 
θ = 0:0.1:2π
x = 1 .+ 2cos.(θ)
y = 1 .+ 2sin.(θ)
plot(x, y, aspect_ratio=:equal)
