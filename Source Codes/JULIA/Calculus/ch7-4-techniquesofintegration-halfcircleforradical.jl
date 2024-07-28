using Plots, LaTeXStrings, Plots.PlotMeasures
pyplot()

function circleShape(h, k, r)
     θ = LinRange(π/2, -π/2, 500) # 2π, π half left circle | π/2, 3π/2 half bottom circle | π/2, -π/2 half top circle
     h .+ r*sin.(θ), k .+ r*cos.(θ)
end

plot(circleShape(0, 0, 1), seriestype = [:shape,], lw = 0.5,
      c =:blue, linecolor = :black,
      legend = false, fillalpha = 0.2, aspect_ratio = 1, showaxis = false)


plot!([0], seriestype="vline", color=:green, label="")
plot!([0], seriestype="hline", color=:green, label="")
plot!(Plots.partialcircle(0,1//1*pi), color=:green, linewidth=2, 
	left_margin=5mm, right_margin=5mm, top_margin=3mm, bottom_margin=25mm)
     
annotate!([(1.3,0.03, ("x", 10, :black)),
           (0.15,1.05, ("y", 10, :black)), 
           (0.37,0.3, (L"A = \int_{-a}^{a} \sqrt{a^{2} - x^{2}} \ dx = \frac{\pi a^{2}}{2}", 10, :black)),
           (0.95,0.8, (L"y=\sqrt{a^{2}-x^{2}}", 10, :black)),
           (1.06,0.03, ("a", 10, :black)),
	   (-1.06,0.03, ("-a", 10, :black))])

scatter!([1], [0], color = "red", label="", markersize = 5)
scatter!([-1], [0], color = "red", label="", markersize = 5)
