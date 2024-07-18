using Plots;

# To plot a circle of radius 3 centered at (-1, 2) 
θ = 0:0.1:2.3π
x = -1 .+ 3cos.(θ)
y = 2 .+ 3sin.(θ)
plot(x, y, xlims=(-5,2), ylims=(-2,6), 
	label="", framestyle=:zerolines)
scatter!([-1],[2], color = "green", label=L"(-1,2)", markersize = 3)
scatter!([-1 + 3cos.(0.66pi)],[2 + 3sin.(0.66pi)], color = "red2", label=L"(x,y)", markersize = 3)
plot!([-1 + 3cos.(0.66pi),-1],[2 + 3sin.(0.66pi),2], label="r=3", linecolor=:green, linestyle=:solid)