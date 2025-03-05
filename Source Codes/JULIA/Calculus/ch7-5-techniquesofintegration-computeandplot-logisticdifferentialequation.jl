# ch2-3-modelingwithfirstorderequations-problem30baseballthrowncomputationa-b

using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms K, L, y(), t, y0

∂ = Differential(t)
yt_sym = dsolve(∂(y(t)) ~ K*y(t)*(L - y(t)), ics=Dict(y(0) => y0)) # equation of t; K, L
yt_ivp = dsolve(∂(y(t)) ~ K*y(t)*(L - y(t)), ics=Dict(y(0) => 800)) # equation of t; K, L

yt = rhs(yt_ivp)    # work with just the expression, not the equation
yt_final = subs(yt, L=>2000, K => 3//10000)  # leaves as an expression of t alone

println("Logistic Differential Equation with Julia")
println("The solution")
sympy.pretty_print(yt_sym)

println("The solution for initial value problem y(0)=800")
sympy.pretty_print(yt_ivp)

println("Logistic Differential Equation with L=2000 and K = 0.00003")
sympy.pretty_print(yt_final)


plot(yt_final, 0,10,
	legend=:bottomright, bottom_margin=5mm, 
	left_margin=5mm,
	xlabel="years", ylabel="population",
	label=L"y(t) = \frac{4000/3}{2/3 + e^{0.6 t}}",
	size=(720, 360), tickfontsize=10)
