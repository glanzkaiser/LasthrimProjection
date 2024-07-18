using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

θ1 = 0:0.01:2π
x1 = 1 .*cos.(θ1)
y1 = 1 .*sin.(θ1)

θ2 = -2π:0.01:2π
x2 = 1 .*cosh.(θ2)
y2 = 1 .*sinh.(θ2)

θ3 = 0:0.01:π/6
x3 = 1 .*cosh.(θ3)
y3 = 1 .*sinh.(θ3)

x4 = 1 .*cos.(θ3)
y4 = 1 .*sin.(θ3)

plot(x1, y1, xlims=(-3,3), ylims=(-2,2),
	size=(900, 600), label=L"(x,y)=(\cos \ t, \sin \ t)", 
	framestyle=:zerolines, legend=:bottomright,
	bottom_margin=3mm)

plot!(x2, y2, 
	size=(900, 600), label=L"(x,y)=(\cosh \ t, \sinh \ t)", 
	framestyle=:zerolines,
	bottom_margin=3mm)

plot!(-x2, y2, 
	size=(900, 600), label=L"(x,y)=(- \cosh \ t, \sinh \ t)", 
	framestyle=:zerolines,
	bottom_margin=3mm)

plot!(x3, y3, 
	size=(900, 600), label=L"(\cosh \ t, \sinh \ t), \ 0 \ ≤ \ t \ ≤ \ \pi/6", 
	linecolor=:green, arrow=true, linewidth=3,
	bottom_margin=3mm)
plot!(x4, y4, 
	size=(900, 600), label=L"(\cos \ t, \sin \ t), \ 0 \ ≤ \ t \ ≤ \ \pi/6", 
	linecolor=:green3, arrow=true, linewidth=3,
	bottom_margin=3mm)

scatter!([1], [0], color = "red1", label="", markersize = 3)
scatter!([cosh(pi/6)], [sinh(pi/6)], color = "red1", label="", markersize = 3)
scatter!([cos(pi/6)], [sin(pi/6)], color = "red1", label="", markersize = 3)

annotate!([(-0.5,0.6, (L"x^{2} + y^{2} = 1", 10, :black))])
annotate!([(1.6,-0.6, (L"x^{2} - y^{2} = 1", 10, :black))])
annotate!([(-1,-0.9, (L"- x^{2} - y^{2} = 1", 10, :black))])