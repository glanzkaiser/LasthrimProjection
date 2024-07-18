using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

    θ = 0:0.1:2π
    ϕ = 0:0.1:2π
    x1 = 1.4 .+ 1.1cos.(θ) 
    y1 = 0 .+ 0.83sin.(θ) 
    x2 = 1.4 .+ 1.1cos.(ϕ) 
    y2 = -0.2 .+ 0.83sin.(ϕ) 
    x3 = 1.4 .+ 0.5cos.(θ) 
    y3 = 0 .+ 0.27sin.(θ) 
   
plot(x1, y1, xaxis=false, yaxis=false, ylims=(-2,3), aspect_ratio=:equal, 
	label="", fill=(0, 0.66, :blue2)) # The blue circle plot
plot!(x2, y2, aspect_ratio=:equal,label="", 
	linecolor=:transparent, fill=(0, 0.13, :blue2)) # The left gray circle plot
plot!(x3, y3, xaxis=false, yaxis=false, ylims=(-2,3), aspect_ratio=:equal, 
	label="", fill=(0, 1.66, :white)) # The white hole
