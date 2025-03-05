using Plots;

# To plot a circle of radius 3 centered at (-2,0) 
θ = 0:0.1:2.3π
x = -2 .+ 3cos.(θ)
y = 0 .+ 3sin.(θ)

x1 = 2 .+ 3cos.(θ)

plot(x, y, xlims=(-6,6), ylims=(-4,4), 
	label="", framestyle=:zerolines)
plot!(x1,y, label="")