using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

function make_fg_plot()
    f(x) = sin(x^2) + cos(2x) - 6
    g(x) = sin(x^2) + cos(2x)

plt = plot(f, 0,4; ylims=(-8,4), label="", xtick=:false, 
	 legend = :topleft, bottom_margin=10mm)

plot!(g, 0,4; ylims=(-8,4), label="")

plot!([2,2],[f(2),g(2)], label="", linecolor=:green)
plot!([2.2,2.2],[f(2.2),g(2.2)], label="", linecolor=:green)

plot!(f,3,3.2, label="", fill=(0, 0.15, :blue))
plot!(g,3,3.2, label="", fill=(0, 0.15, :blue))

for i=-2:0.2:2        
	plot!(plt, [2+i, 2+i], ([f(2+i), g(2+i)]); label="")
end

for i=0.2:0.4:8        
	scatter!([(i)/2],[(g(i/2)+f(i/2))/2], color="blue1", label="", markersize=3)
end

annotate!([(0,-9, (L"a", 10, :black))])
annotate!([(0,-8.1, (L"|", 10, :black))])
annotate!([(3,-9, (L"x", 10, :black))])
annotate!([(3,-8.1, (L"|", 10, :black))])
annotate!([(4,-9, (L"b", 10, :black))])
annotate!([(4,-8.1, (L"|", 10, :black))])
annotate!([(3.15,1.3, (L"△x", 10, :black))])
annotate!([(0.15,1.4, (L"g(x)", 10, :black))])
annotate!([(0.15,-5.8, (L"f(x)", 10, :black))])

return plt
end

make_fg_plot()
