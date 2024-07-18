using SymPy, Plots, LaTeXStrings, PrettyTables, Plots.PlotMeasures
gr()

p0 = 6400000000
a = 13500000
acresmile = 640
acreforperson = 1/2
k = 0.0132
pt = a*acresmile*(1/acreforperson)

f(x) = p0*exp(k*x)

plot(f, xlims=(0,83),ylims=(6000000000,23000000000),
	label="World Population", 
	right_margin=5mm, left_margin=5mm, bottom_margin=5mm,
	xformatter = x->string(Int(x)+2004),
	yformatter = y->string(Int(y)/1000000000," B"),	
	#framestyle=:zerolines,	
	legend=:topright)
xlabel!("Year")
ylabel!("Human")
plot!([pt], seriestype="hline", linestyle=:dot, color=:red, label="maximum limit")
scatter!([75], [f(75)], color = "red1", label="2079", markersize = 3)
