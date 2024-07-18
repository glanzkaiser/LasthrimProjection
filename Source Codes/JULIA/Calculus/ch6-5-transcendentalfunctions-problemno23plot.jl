using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

t1 = 70 # room temperature
t0 = 98.6 # alive temperature
tt = 82 # temperature when found dead
tt1 = 76 # temperature one hour after being found dead

k = -log((tt-t1)/(tt1-t1))

f(x) = t1 + (t0-t1)*exp(k*x)

plot(f, xlims=(0,12),ylims=(0,120),
	label=L"T(t) = T_{1} + (T_{0} - T_{1})e^{kt}", 
	right_margin=5mm, left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topright)
xlabel!("t / time in hour")
ylabel!("Temperature in Fahrenheit")
plot!([70], seriestype="hline", linestyle=:dot, color=:green, label="Room temperature = 70")

scatter!([1.25], [f(1.25)], color = "red1", label="T(1.25)=82", markersize = 3)
scatter!([2.25], [f(2.25)], color = "blue1", label="T(2.25)=76", markersize = 3)