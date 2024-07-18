using SymPy, Plots, LaTeXStrings, PrettyTables, Plots.PlotMeasures
gr()

t1 = 70 # room temperature
t0 = 98.6 # alive temperature
tt = 82 # temperature when found dead
tt1 = 76 # temperature one hour after being found dead

k = -log((tt-t1)/(tt1-t1))

f(x) = t1 + (t0-t1)*exp(k*x)

plot(f, xlims=(0,48),ylims=(0,120),
	label="Room temperature = 70", 
	right_margin=5mm, left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topright)
xlabel!("t / time in hour")
ylabel!("Temperature in Fahrenheit")

k1 = -log((tt-10)/(tt1-10))
g1(x) = 10 + (t0-10)*exp(k1*x)
w1 = 10 - (log((tt-10)/(t0-10))/k1)

k2 = -log((tt-20)/(tt1-20))
g2(x) = 20 + (t0-20)*exp(k2*x)
w2 = 10 - (log((tt-20)/(t0-20))/k2)

k3 = -log((tt-30)/(tt1-30))
g3(x) = 30 + (t0-30)*exp(k3*x)
w2 = 10 - (log((tt-30)/(t0-30))/k3)

k4 = -log((tt-40)/(tt1-40))
g4(x) = 40 + (t0-40)*exp(k4*x)
w4 = 10 - (log((tt-40)/(t0-40))/k4)

k5 = -log((tt-50)/(tt1-50))
g5(x) = 50 + (t0-50)*exp(k5*x)
w5 = 10 - (log((tt-50)/(t0-50))/k5)

k6 = -log((tt-60)/(tt1-60))
g6(x) = 60 + (t0-60)*exp(k6*x)
w6 = 10 - (log((tt-60)/(t0-60))/k6)


println(pretty_table(String, 
 	 vcat([[i -log((tt-i)/(tt1-i)) 10-(log((tt-i)/(t0-i))/(-log((tt-i)/(tt1-i)))) (log((tt-i)/(t0-i))/(-log((tt-i)/(tt1-i)))) ] for i in 10:10:70]...); 
  	header=["Room temperature (F)", "k", "w", "Death for (in hours)"]))

plot!(g1, label="Room temperature = 10")
plot!(g2, label="Room temperature = 20")
plot!(g3, label="Room temperature = 30")
plot!(g4, label="Room temperature = 40")
plot!(g5, label="Room temperature = 50")
plot!(g6, label="Room temperature = 60")
