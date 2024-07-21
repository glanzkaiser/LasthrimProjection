using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms t, α, ts
@syms u()

# Computing IVP with SymPy
u(t).diff(t) 
diffeq = Eq(u(t).diff(t), -α*(u(t)^4) ); string(diffeq)
#diffeq2 = Eq(u(t).diff(t), -α*((u(t)^4) - ts(t)^4) ); string(diffeq2)

# To solve the ODE, pass it and the function to solve for to dsolve.
ut = dsolve(diffeq, u(t))
# To solve the Initial Value Problem, initial temperature is 2000 K
ivp = dsolve(diffeq, u(t), ics = Dict(u(0) => 2000))

y = ivp(Dict(α => 2e-12))

plot(y, 0,1000,
	legend=:topright, bottom_margin=5mm, 
	left_margin=5mm,
	xlabel="time", ylabel="temperature (K)",
	label=L" u(t) = \sqrt[3]{\frac{1}{3 \cdot 2 \times 10^{-12} t + \frac{1}{8000000000}}}", 
	xformatter = x->string(Int(x/1)," "),
	size=(720, 360), tickfontsize=10)

