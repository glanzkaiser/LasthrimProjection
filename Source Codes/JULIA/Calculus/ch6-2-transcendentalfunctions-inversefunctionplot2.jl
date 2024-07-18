using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

# Define the x-range explicitly
xrange = 0.0:0.1:23.0
# Define the transform (or anything else like `(x,y) -> (x, -y)` etc.
xyidentity = (x,y) -> (x,y)
xytransform = (x,y) -> (y, x)

function make_fg_plot()
    f(x) = 2x+3 
   
    plt = plot(; xtick=:true, xlims = (-5,23), ylims = (-5, 23), 
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

    scatter!([1], [f(1)], color = "red1", label="", markersize = 3)
    scatter!([f(1)], [1], color = "red1", label="", markersize = 3)
    scatter!([4], [f(4)], color = "red1", label="", markersize = 3)
    scatter!([f(4)], [4], color = "red1", label="", markersize = 3)
    plot!([4,f(4)],[f(4),4], label="", linecolor=:green, line=(:dash))
    plot!([1,f(1)],[f(1),1], label="", linecolor=:green, line=(:dash))
    annotate!([(0.1,4.7, (L"(b,a)", 7, :black))])
    annotate!([(3.3,10.7, (L"(d,c)", 7, :black))])
    annotate!([(5.1,0, (L"(a,b)", 7, :black))])
    annotate!([(11.1,3.3, (L"(c,d)", 7, :black))])
    annotate!([(3,-1.7, (L"l_{1}", 7, :black))])
    annotate!([(-0.3,1.8, (L"l_{2}", 7, :black))])

    end
    return plt
end

make_fg_plot()