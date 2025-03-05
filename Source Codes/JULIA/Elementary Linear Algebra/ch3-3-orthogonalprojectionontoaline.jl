using Plots, LaTeXStrings
pyplot()

function circleShape(h, k, r)
     θ = LinRange(0, 2*π, 500)
     h .+ r*sin.(θ), k .+ r*cos.(θ)
end

plot(circleShape(0, 0, 1), seriestype = [:shape,], lw = 0.5,
      c =:white, linecolor = :black,
      legend = false, fillalpha = 0.2, aspect_ratio = 1, showaxis = false)

plot!([0], seriestype="vline", color=:green, label="")
plot!([0], seriestype="hline", color=:green, label="")

plot!([0,sin.(pi/4)],[0,cos.(pi/4)], linecolor=:green, linestyle=:solid)
plot!([0,sin.(pi/4)],[cos.(pi/4),cos.(pi/4)], linecolor=:green, linestyle=:dash)
plot!([sin.(pi/4),sin.(pi/4)],[0,cos.(pi/4)], linecolor=:green, linestyle=:dash)

# Plots.partialcircle(pi-0.37,pi-0.88pi) -> starting position pi-0.37pi, end position pi -0.88pi
plot!(Plots.partialcircle(0,1//4*pi,100,0.1), color=:black, arrow=true)
     
annotate!([(1.1,0.1, ("x", 8, :black)),
           (0.15,1.1, ("y", 8, :black)), 
           (0.17,-0.1, ("O (0,0)", 8, :black)),
           (0.17,0.07, (L"\theta", 8, :black)),
           (0.84,0.77, (L"(\sin \ \theta, \cos \ \theta)", 8, :black)),
           (0.8,-0.08, (L"e_{1} =  (1,0)", 8, :black)),
           (-0.2,0.73, (L"e_{2} = (0,1)", 8, :black))])

scatter!([sin.(pi/4)], [0], color = "green", label="", markersize = 3)
scatter!([0], [cos.(pi/4)], color = "green", label="", markersize = 3)
scatter!([sin.(pi/4)], [cos.(pi/4)], color = "green", label="", markersize = 3)
