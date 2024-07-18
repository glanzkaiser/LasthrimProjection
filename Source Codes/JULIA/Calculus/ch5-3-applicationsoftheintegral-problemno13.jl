using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

function make_fg_plot()
    g(x) = sin(x^2) + cos(2x) -1

    yshift = y -> y + 5
    yreflection = y -> -y
    ytransform = yshift ∘ yreflection

    plt = plot(; xtick=:false, ylims = (-8, 15), 
	 legend = :topleft, bottom_margin=5mm)
    for (T, attrs) in [(identity, (;label = "", linecolor = :green)), 
                       (ytransform, (;label = "", linecolor = :red))]
        
        plot!(plt, T ∘ g, 2, 4; label="")
	
	plot!(g, fillrange = T ∘ g, fillalpha = 0.35, c = 1, 
	label = "", legend=:topright)
	
	annotate!([(2.03,9, (L"f(x)", 10, :black))])
	annotate!([(2.03,-3, (L"g(x)", 10, :black))])
	annotate!([(2,-9, (L"a", 10, :black))])
	annotate!([(2,-8.1, (L"|", 10, :black))])
	annotate!([(3,-9, (L"x", 10, :black))])
	annotate!([(3,-8.1, (L"|", 10, :black))])
	annotate!([(4,-9, (L"b", 10, :black))])
	annotate!([(4,-8.1, (L"|", 10, :black))])
    end
    return plt
end

make_fg_plot()