using Plots;

# To plot a circle of radius 2 centered at (2, 2) 
θ = 0:0.1:2.3π
x = 2 .+ 2cos.(θ)
y = 2 .+ 2sin.(θ)
plot(x, y, xlims=(-1,5), ylims=(-1,6), linecolor=:green,
	label="", framestyle=:zerolines)
scatter!([2],[2], color = "green", label="", markersize = 3)
scatter!([2 + 2cos.(0.26pi)],[2 + 2sin.(0.26pi)], color = "red2", label=L"(x,y)", markersize = 3)
plot!([2 + 2cos.(0.26pi),2],[2 + 2sin.(0.26pi),2], label="", linecolor=:black, linestyle=:solid)

# To plot the small circle between the big circle and xy axes
x2 = 0.33 .+ 0.33cos.(θ)
y2 = 0.33 .+ 0.33sin.(θ)
plot!(x2,y2, label="", linecolor=:blue)
scatter!([0.33],[0.33], color = "green", label="", markersize = 1)
scatter!([0.33 + 0.33cos.(0)],[0.33 + 0.33sin.(0)], color = "green", label="", markersize = 1)
plot!([0.33 + 0.33cos.(0),0.33],[0.33 + 0.33sin.(0),0.33], label="", linecolor=:black, linestyle=:solid)

annotate!([(2.6,2.9, (L"R", 10, :black))])
annotate!([(0.46,0.42, (L"r", 8, :black))])