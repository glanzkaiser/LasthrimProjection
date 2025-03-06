using Plots, LaTeXStrings
pyplot()

function circleShape(h, k, r)
     θ = LinRange(0, 2*π, 500)
     h .+ r*sin.(θ), k .+ r*cos.(θ)
end

plot(circleShape(0, 0, 1), seriestype = [:shape,], lw = 0.5,
      c =:blue, linecolor = :black,
      legend = false, fillalpha = 0.2, aspect_ratio = 1, showaxis = false)

plot!([0], seriestype="vline", color=:green, label="")
plot!([0], seriestype="hline", color=:green, label="")
plot!([0.707106781,0],[0.707106781,0], linecolor=:green)
plot!([0.707106781,0.707106781],[0.707106781,0], linestyle=:dash, linecolor=:green)
plot!(Plots.partialcircle(0,1//4*pi,100,0.1), color=:red, arrow=true)
plot!(Plots.partialcircle(0,1//4*pi), color=:red, linewidth=2)
plot!(Plots.partialcircle(0,0.25*pi,100,0.7), color=:red, linewidth=2)
     
annotate!([(1.1,0, ("x", 10, :red)), 
           (0.17,0.05, ("t", 8, :red)),
           (0.15,1.03, ("y", 10, :red)), 
           (0.17,-0.1, ("O (0,0)", 10, :red)),
	   (0.48,0.55, ("C", 10, :red)),
           (0.72,-0.073, ("B", 10, :red)),
           (1.08,-0.08, ("A (1,0)", 10, :red)),
	  (-0.08,1.03, ("(0,1)", 10, :red)),
           (0.83,0.87, (L"P(\cos \ t, \sin \ t)", 10, :red))])

scatter!([0.707106781], [0], color = "red", label="", markersize = 5)
scatter!([1], [0], color = "red", label="", markersize = 5)
scatter!([0.707106781], [0.707106781], color = "red", label="", markersize = 5)
scatter!([0.5], [0.5], color = "red", label="", markersize = 5)
