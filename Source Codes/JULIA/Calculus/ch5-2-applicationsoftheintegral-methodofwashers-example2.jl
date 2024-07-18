using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

function make_fg_plot()
    g(x) = sqrt(4-x^2)
	
    yshift = y -> y 
    yreflection = y -> -y
    ytransform = yshift ∘ yreflection
    #  To plot a circle of radius 2 centered at (0, 0) 
    θ = 0:0.1:2π
    x1 = 0 .+ 2cos.(θ) 
    y1 = 0 .+ 2sin.(θ) 
    
    plt = plot(; xtick=:false, xlims=(-2,3), ylims = (-2.5, 2.5), 
	 legend = :topleft, label = "", framestyle=:zerolines, bottom_margin=5mm)
    for (T, attrs) in [(identity, (;label = "", linecolor = :green)), 
                       (ytransform, (;label = "", linecolor = :green))]
        plot!(plt, T ∘ g, 0, 4; label="") # Plot g and define the interval of existence
        # Fill the circle from 0 to 2
	plot!(g, 0,2, 
	fillrange = T ∘ g, fillalpha = 0.35, c = 1, 
	label = "")
	
	# horizontal slicing' filling
	# Fill from x=0 to x=2 with lower bound will be -0.2 
	plot!(g,0,2, 
		fillrange = -0.2, fillalpha = 0.15, c = 2, 
		label = "")
	# Cover half top of the circle	
	plot!(g,0,2, 
		fillrange = 0, fillalpha = 0.35, c = 1, 
		label = "")
	# Create curly bracket
	topy = -0.65 # if smaller than -0.3 then it will point down, if greater it will point up

	# Left bracket starting from 0.01π, and ending at the middle at 0.2π 
	bezxl = [0.01π, 0.01π, 0.3π, 0.3π] 
	bezyl = [-0.3, topy, -0.3, topy]
	curves!(bezxl, bezyl; linecolor=:blue, label="")

	# Right bracket starting from the middle at 0.2π and end at 0.6π
	bezxr = [0.3π, 0.3π, 0.6π, 0.6π]
	bezyr = [topy, -0.3, topy, -0.3]
	curves!(bezxr, bezyr; linecolor=:blue, label="")

	plot!([-1], seriestype="vline", color=:blue2, label="")
	
	annotate!([(-0.7,1.5, (L"x=-1", 10, :blue2))])
	annotate!([(1,-1.1, (L"\sqrt{4-y^{2}}", 10, :blue2))])
    end
    return plt
end

make_fg_plot()

