using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

function make_fg_plot()
    f(x) = sin(x^2) + cos(2x) - 6
    g(x) = sin(x^2) + cos(2x)

    yshift = y -> y + 5
    yreflection = y -> -y
    ytransform = yshift ∘ yreflection

    plt = plot(; xtick=:false, ylims = (-8, 15), 
	 legend = :topleft, bottom_margin=5mm)
    for (T, attrs) in [(identity, (;label = "", linecolor = :green)), 
                       (ytransform, (;label = "", linecolor = :red))]
        plot!(plt, T ∘ f, 2, 4; label="")
        plot!(plt, T ∘ g, 2, 4; label="")

	for i=0:0.2:2        
	plot!(plt, [2+i, 2+i], T.([f(2+i), g(2+i)]); label="")
	end
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
#=
# To calculate the area 
h(x) = sin(x^2) + cos(2x) - 6 - (sin(x^2) + cos(2x))
integrate(h,2,4).evalf()
=#