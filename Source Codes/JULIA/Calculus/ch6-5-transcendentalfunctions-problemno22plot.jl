using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

t1 = 40
t0 = 350
tt = 250
t = 15

k = log((tt-t1)/(t0-t1))/t

f(x) = t1 + (t0-t1)*exp(k*x)

plot(f, xlims=(0,330),ylims=(0,370),
	label=L"T(t) = T_{1} + (T_{0} - T_{1})e^{kt}", 
	right_margin=5mm, left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topright)
xlabel!("t / time in minutes")
ylabel!("Temperature in Fahrenheit")

scatter!([15], [f(15)], color = "red1", label="T(15)=250", markersize = 3)