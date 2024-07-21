
using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms q, t, r
@syms q()

# Computing IVP with SymPy
q(t).diff(t) 
diffeq = Eq(q(t).diff(t), -r*q(t) ); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
qt = dsolve(diffeq, q(t))
# To solve the Initial Value Problem q(0)=1
ivp = dsolve(diffeq, q(t), ics = Dict(q(0) => 1))

halflife = 5730
rate = log(1/2)/(-halflife)

y = ivp(Dict(r => rate))

plot(y, 0,100000,
	legend=:topright, bottom_margin=5mm, 
	left_margin=5mm,
	xlabel="years (in thousand)", ylabel="remains",
	label=L"y(t) = e^{-1.2 \times 10^{-4} t}", 
	xformatter = x->string(Int(x/1000)," "),
	size=(720, 360), tickfontsize=10)

