using Plots, LaTeXStrings
pyplot()

function circleShape(h, k, r)
     θ = LinRange(0, 2*π, 500)
     h .+ r*sin.(θ), k .+ r*cos.(θ)
end

plot(circleShape(0, 0, 1), seriestype = [:shape,], lw = 0.5,
      c =:blue, linecolor = :black,
      legend = false, fillalpha = 0.2, aspect_ratio = 1, showaxis = false)

t = L"45^0"
a = L"$\ulcorner$"

plot!([0], seriestype="vline", color=:green, label="")
plot!([0], seriestype="hline", color=:green, label="")
plot!([0.707106781,-1.5],[0.707106781,0], linecolor=:green)
plot!([0.707106781,0],[0.707106781,-0.6], linecolor=:green)
plot!([0.707106781,1.0],[0.707106781,0.8], linecolor=:green)
plot!([1.0,1.0],[0.0,0.8], linecolor=:green)
plot!(Plots.partialcircle(0,1//4*pi), color=:red, linewidth=2)
     
annotate!([
	   (0.7,-0.1, ("t", 10, :red)),
	   (1.06,0.5, ("t", 10, :red)),
	   (0.1,-0.1, ("O ", 10, :red)),
           (-1.5,-0.1, ("A (x,0)", 10, :red)),
	   (0.2,-0.6, ("B (0,y)", 10, :red)),
	   (0.3,0.1, ("C", 10, :red)),
	   (1.07,0.86, ("F", 10, :red)),
           (1.18,-0.08, ("D(1,0)", 10, :red)),
           (-0.1,1.03, ("(0,1)", 10, :red)),
           (0.77,0.77, (L"E", 10, :red))])

scatter!([1], [0], color = "red", label="", markersize = 5)
scatter!([1], [0.8], color = "red", label="", markersize = 5)
scatter!([0.33], [0], color = "red", label="", markersize = 5)
scatter!([-1.5], [0], color = "red", label="", markersize = 5)
scatter!([0], [-0.6], color = "red", label="", markersize = 5)
scatter!([1], [0], color = "red", label="", markersize = 5)
scatter!([0.707106781], [0.707106781], color = "red", label="", markersize = 5)
