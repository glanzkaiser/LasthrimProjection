using SymPy, Plots, LaTeXStrings, PrettyTables, Plots.PlotMeasures
gr()

L = 100 # 100 % of people

@syms k1
k0 = solve(1/2-exp(-5k1))
k = k0[1]

f(x) = L*(1-exp(-k*x))

plot(f, xlims=(0,51),ylims=(0,120),
	label="News Spreading", 
	right_margin=5mm, left_margin=5mm, bottom_margin=5mm,
	xformatter = x->string(Int(x)),
	yformatter = y->string(Int(y),"%"),	
	#framestyle=:zerolines,	
	legend=:topright)
xlabel!("Day")
ylabel!("Percentage of People")
