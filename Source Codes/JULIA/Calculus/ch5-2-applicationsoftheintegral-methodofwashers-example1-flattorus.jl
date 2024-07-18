using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

    θ = 0:0.1:2π
    ϕ = 0:0.1:2π
    x1 = 1.6 .+ 0.5cos.(θ) 
    y1 = 0 .+ 1.23sin.(θ) 
    x2 = 1.4 .+ 0.5cos.(ϕ) 
    y2 = 0 .+ 1.2sin.(ϕ) 
    x3 = 1.6 .+ 0.13cos.(θ) 
    y3 = 0 .+ 0.37sin.(θ) 
   
plot(x1, y1, xaxis=false, yaxis=false, ylims=(-2,3), aspect_ratio=:equal, 
	label="", fill=(0, 0.66, :blue2)) # The blue circle plot
plot!(x2, y2, aspect_ratio=:equal,label="", 
	linecolor=:transparent, fill=(0, 0.13, :blue2)) # The left gray circle plot
plot!(x3, y3, xaxis=false, yaxis=false, ylims=(-2,3), aspect_ratio=:equal, 
	label="", fill=(0, 1.66, :white)) # The white hole
