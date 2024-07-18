using Plots, LaTeXStrings; plotlyjs()

# To plot a circle of radius 4 centered at (0, 1) 
θ = 0π:0.01:2π
x = -4 .+ 4cos.(θ)
y = -6 .+ 4sin.(θ)
plot(x, y, xlims=(-10.2,1.2), ylims=(-10,1.2), 
	framestyle=:zerolines, label="", linecolor=:blue2)

plot!([-10,2],[-2,-2], label="y = -2", linecolor=:red2)
