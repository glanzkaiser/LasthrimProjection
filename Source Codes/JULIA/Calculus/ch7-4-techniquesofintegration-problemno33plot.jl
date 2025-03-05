using PolygonArea, Plots, LaTeXStrings

c1 = circle((0.9, 1), 2, 100)  # Actually, a regular 100-gon
c2 = circle((0.9, -1), 2*sqrt(2), 100)  # Actually, a regular 100-gon

plot(c1)
plot!(c2)
plot!(c2 ∩ c1, color=:green) 

plot!([0.9,0.9],[1,-1], label="", linecolor=:green1)
plot!([0.9,2.9],[-1,-1], label="", linecolor=:green1)
plot!([2.9,2.9],[-1,1], label="", linecolor=:green1)
plot!([0.9,2.9],[1,1], label="", linecolor=:green1)
plot!([0.9,0.9],[1,3], label="", linecolor=:black, linestyle=:dash)
plot!([0.9,-1.1],[1,1], label="", linecolor=:black, linestyle=:dash)

plot!([0.9,4.2],[-1+2*sqrt(2),-1+2*sqrt(2)], label="", linecolor=:black, linestyle=:dot)
plot!([0.9,4.2],[-1,-1], label="", linecolor=:black, linestyle=:dot)

plot!([4.2,4.2],[-1,-1+2*sqrt(2)], label="", linecolor=:black)
plot!([4,4.4],[-1+2*sqrt(2),-1+2*sqrt(2)], label="", linecolor=:black)
plot!([4,4.4],[-1,-1], label="", linecolor=:black)

scatter!([0.9], [1], color = "black", label="", markersize = 3)
scatter!([0.9], [-1], color = "black", label="", markersize = 3)

annotate!([(1.1,1.4, (L"O", 10, :black)),
		   (0.9,-1.4, (L"C", 10, :black)),
		   (4.7,0.4, (L"\sqrt{2} a", 10, :black)),
		   (0.7,-0.1, (L"a", 10, :black))])

#=
using Plots;

# To plot a circle of radius 2*sqrt(2) centered at (3,-2) 
θ = 0:0.1:2.3π
x = 3 .+ 2*sqrt(2)cos.(θ)
y = -2 .+ 2*sqrt(2)sin.(θ)
# To plot a circle of radius 2 centered at (3,0) 
x1 = 3 .+ 2cos.(θ)
y1 = 0 .+ 2sin.(θ)

plot(x, y, xlims=(-6,6), ylims=(-4,4), 
	label="", framestyle=:zerolines)
plot!(x1,y1, label="")
=#
