using SymPy, Plots, LaTeXStrings, PrettyTables, Plots.PlotMeasures
gr()

p0 = 20000 # car price
r = 2.5/100 # annual inflation rate

f(x) = p0*exp(r*x)

plot(f, xlims=(0,20),ylims=(20000,40000),
	label="Car Price", 
	right_margin=5mm, left_margin=5mm, bottom_margin=5mm,
	xformatter = x->string(Int(x+2000)),
	yformatter = y->string(Int(y)),	
	#framestyle=:zerolines,	
	legend=:topright)
xlabel!("Year")
ylabel!("USD")
