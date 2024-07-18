using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

function make_fg_plot()
    g(x) = sqrt(x)
	
    yshift = y -> y 
    yreflection = y -> -y
    ytransform = yshift ∘ yreflection
    #  To plot a circle of radius 1 centered at (1.6, 0) 
    θ = 0:0.1:2π
    ϕ = 0:0.1:2π
    x1 = 1.6 .+ 0.5cos.(θ) 
    y1 = 0 .+ 1.23sin.(θ) 
    x2 = 1.4 .+ 0.5cos.(ϕ) 
    y2 = 0 .+ 1.2sin.(ϕ) 
    x3 = 4 .+ 0.7cos.(θ) 
    y3 = 0 .+ 1.97sin.(θ) 
    
    plt = plot(; xtick=:false, ylims = (-3, 3), 
	 legend = :topleft, label = "", bottom_margin=10mm)
    for (T, attrs) in [(identity, (;label = "", linecolor = :green)), 
                       (ytransform, (;label = "", linecolor = :green))]
        plot!(plt, T ∘ g, 0, 4; label="") # Plot g and define the interval of existence
        plot!(x1, y1, aspect_ratio=:equal, label="", fill=(0, 0.66, :blue2)) # The middle circle plot
	plot!(x2, y2, aspect_ratio=:equal, rotation=0, label="", 
		linecolor=:transparent, fill=(0, 0.13, :blue2)) # The left circle plot
	plot!(x3, y3, aspect_ratio=:equal, label="") # The right circle plot
	
	plot!([1.6,1.6],[0,g(1.6)], label="", linecolor=:green4)
	plot!([1.6,1.6],[-3,-g(1.6)], label="", linesytle=:dash, linecolor=:green4)

	annotate!([(1.8,0.4, (L"\sqrt{x}", 11, :green4))])
	annotate!([(1.23,1.4, (L"△ x", 11, :green4))])
	annotate!([(1.55,-3.2, (L"x", 11, :green4))])
    end
    return plt
end

make_fg_plot()
