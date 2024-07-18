using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

# Define the x-range explicitly
xrange = 0.0:0.1:20.0
# Define the transform (or anything else like `(x,y) -> (x, -y)` etc.
xyidentity = (x,y) -> (x,y)
xytransform = (x,y) -> (y, x)

function make_fg_plot()
    f(x) = log(x) 
   
    plt = plot(; xtick=:true, xlims = (-15,15), ylims = (-15, 15), 
	 legend = :topleft, bottom_margin=5mm)
    for (T, attrs) in [(xyidentity, (;label = "", linecolor = :green)), 
                       (xytransform, (;label = "", linecolor = :red))]
    # Apply the transformation to all tuples (x, f(x))
    transformedPoints = T.(xrange, f.(xrange))
    # Make vectors out of the resulting tuples for plotting
    newx = first.(transformedPoints)
    newy = last.(transformedPoints)

    plot!(plt, newx, newy; label="")
 
    g(x)=x
    plot!(g,linecolor=:green, line=(:dash), label="")

    scatter!([4], [f(4)], color = "red1", label="", markersize = 3)
    scatter!([f(4)], [4], color = "red1", label="", markersize = 3)
    plot!([4,f(4)],[f(4),4], label="", linecolor=:green, line=(:dash))
    annotate!([(0.1,4, (L"(y,x)", 7, :black))])
    annotate!([(5.1,0, (L"(x,y)", 7, :black))])
    annotate!([(1.9,-2, (L"y=f(x)", 7, :black))])
    annotate!([(-1.8,1.8, (L"y=f^{-1}(x)", 7, :black))])

    end
    return plt
end

make_fg_plot()