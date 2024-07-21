using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms q, t
@syms q()

# Computing IVP with SymPy
q(t).diff(t) # Derivatives of f(t) are unevaluated
diffeq = Eq(q(t).diff(t), 10 + 5*sin(2t) - 1/2*q(t) ); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
qt = dsolve(diffeq, q(t))
# To solve the Initial Value Problem y(π) = 0
ivp = dsolve(diffeq, q(t), ics = Dict(q(0) => 0))

# sympy.classify_ode(diffeq)

plot(ivp,  color=:blue, xlims=(0,23), ylims=(-2,23), 
	label=L"q(t) = 20 - \frac{40}{17} \cos (2t) + \frac{10}{17} \sin (2t) - \frac{300}{17}e^{-t/2}",framestyle=:zerolines)
