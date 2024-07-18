using Plots, LaTeXStrings; gr()

# To plot a circle of radius 2 centered at (0, 0) 
θ = 0:0.01:2π
x = 0 .+ 2cos.(θ)
y = 0 .+ 2sin.(θ)

plot(x, y, xlims=(-3,3), label="")

# Plot a cycloid
θc = 0.9:0.1:1.1π
xc = 1.4θc .- sin.(θc) .- 2.45
yc = -0.55 .- 2.3cos.(θc) 
plot!(xc, yc, xtick=false,ytick=false, xaxis=false, yaxis=false,
	label="",
	linestyle=:dash)

scatter!([-2], [-2], color = "red1", label="", markersize = 3)
scatter!([0], [0], color = "red1", label="", markersize = 3)
scatter!([0 + 2cos(1.2π)], [0 + 2sin(1.2π)], color = "red1", label="", markersize = 3)

plot!(Plots.partialcircle(0.5,1//2*pi,100,-0.2), label="",color=:blue, arrow=true)

# Fake x and y axis
plot!([3,-2],[-2,-2], label="", linecolor=:black)
plot!([-2,-2],[-2.2,2.2], label="", linecolor=:black)

# Green Triangle and dash
plot!([0,0 + 2cos(1.2π)],[0,0 + 2sin(1.2π)], label="", linecolor=:green)
plot!([0,0],[0,-1.17], label="", linecolor=:green)
plot!([0,0 + 2cos(1.2π)],[-1.17,0 + 2sin(1.2π)], label="", linecolor=:green)
plot!([0,0],[-1.17,-2], label="", linecolor=:green, linestyle=:dash)

annotate!([(-0.19,-0.3, (L"\theta", 10, :blue))])
annotate!([(-1.9,-1.2, (L"P(x,y)", 8, :blue))])
annotate!([(-2.2,-2, (L"O", 8, :blue))])
annotate!([(0,0.2, (L"C", 8, :blue))])
annotate!([(0.1,-1.2, (L"Q", 8, :blue))])
annotate!([(0.1,-2.2, (L"T", 8, :blue))])
annotate!([(-0.7,-0.3, (L"a", 8, :blue))])
