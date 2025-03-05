# https://discourse.julialang.org/t/sympy-computation-with-dsolve-for-logistic-differential-equation/104338/3

using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms a,b, x(), k,t, x0

∂ = Differential(t)
xt_sym = dsolve(∂(x(t)) ~ (a-x(t))*(b-x(t))*k, ics=Dict(x(0) => 0)) # equation of t; a, b

println("Logistic Differential Equation with Julia")
println("The solution")
sympy.pretty_print(xt_sym)

println("")
println("If 1 gram of the substance is formed in 20 minutes / x(20)=1")
println("This is the solution with a=2 and b=4 :")
xt = rhs(xt_sym)    # work with just the expression, not the equation
xt_findk = subs(xt, t=>20, a=>2, b=> 4)  # leaves as an expression of K alone
sympy.pretty_print(subs(xt, a=>2, b=> 4))

println("")
println("The value of  k :")
kvalue = solveset(xt_findk ~ 1, k)
sympy.pretty_print(kvalue)

println("")
println("This is how much of the substance will be present in 1 hour (in gram) :")
k1 = -(1/40)*log(2/3)
xt_final = subs(xt, k=>k1, a=>2, b=> 4) 

sympy.pretty_print(xt_final(60))

plot(xt_final, 0,250,
	legend=:bottomright, bottom_margin=5mm, 
	left_margin=5mm,
	xlabel="Time (minutes)", ylabel="Amount of a Substance (in gram)",
	label=L"x(t) = \frac{ab(1- e^{(a-b)kt})}{b-a e^{(a-b)kt}}",
	size=(720, 360), tickfontsize=10)
