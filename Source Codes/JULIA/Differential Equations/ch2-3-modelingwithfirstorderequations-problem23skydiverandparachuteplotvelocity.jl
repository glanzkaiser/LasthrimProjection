using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms t
@syms v()

# Computing IVP with SymPy
v(t).diff(t) 
diffeq = Eq(v(t).diff(t), -(v(t)/7.5) + 32); string(diffeq)
diffeq2 = Eq(v(t).diff(t), -(32v(t)/15) + 32); string(diffeq)

# To solve the ODE, pass it and the function to solve for to dsolve.
vt = dsolve(diffeq, v(t))
vt2 = dsolve(diffeq2, v(t))
# To solve the Initial Value Problem, initial velocity is 0 ft/s
ivp = dsolve(diffeq, v(t), ics = Dict(v(0) => 0))
# To solve the Initial Value Problem, initial velocity is 176.7 ft/s
ivp2 = dsolve(diffeq2, v(t), ics = Dict(v(0) => 176.7))

y = ivp
y2 = 15+161.7*exp(-32*(t-10)/15) 
#shifting the graph to the right when parachute opens after 10 s

plot(y, 0,10,
	legend=:topright, bottom_margin=5mm, 
	left_margin=5mm,
	xlabel="time (seconds)", ylabel="velocity (ft/s)",
	label=L" v(t) = 240(1 - e^{-t/7.5})", 
	xformatter = x->string(Int(x/1)," "),
	size=(720, 360), tickfontsize=10)
plot!(y2, 10,266.6,
	legend=:topright, bottom_margin=5mm, 
	left_margin=5mm,
	xlabel="time (seconds)", ylabel="velocity (ft/s)",
	label=L" v(t) = 15 + 161.7 e^{-32t/15}", 
	xformatter = x->string(Int(x/1)," "),
	size=(720, 360), tickfontsize=10)
