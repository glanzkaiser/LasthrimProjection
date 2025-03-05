# https://discourse.julialang.org/t/sympy-computation-with-dsolve-for-logistic-differential-equation/104338/3

using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
@syms K, L, y(), t, y0

∂ = Differential(t)
yt_sym = dsolve(∂(y(t)) ~ K*y(t)*(16 - y(t)), ics=Dict(y(0) => y0)) # equation of t; K, y0, L
yt_ivp = dsolve(∂(y(t)) ~ K*y(t)*(16 - y(t)), ics=Dict(y(0) => 2)) # equation of t; K, L

yt = rhs(yt_ivp)    # work with just the expression, not the equation
yt_findK = subs(yt, t=>50)  # leaves as an expression of K alone

#K1 = solveset(yt_findK ~ 4, K)
k = log(3/7)/(-800) # same as k = log(7/3)/(800) 
#k = log(7/3)/(800) # better solve it by hand manually than by sympy

yt_final = dsolve(∂(y(t)) ~ k*y(t)*(16 - y(t)), ics=Dict(y(0) => 2)) # equation of t; K, L

println("Logistic Differential Equation with Julia")
println("The solution")
sympy.pretty_print(yt_sym)

println("")
println("The solution for initial value problem y(0)=2")
sympy.pretty_print(yt_ivp)

println("")
println("The value of K:")
sympy.pretty_print(solveset(yt_findK ~ 4, K))

println("")
println("Logistic Differential Equation general solution")
sympy.pretty_print(yt_final)

println("")
println("In 90 years from 1925 the population will be (in billion):")
sympy.pretty_print(yt_final(90))

println("")
println("The population will be 9 billion in (in years from 1925):")
yt1 = rhs(yt_final)
t9 = solveset(yt1 ~ 9, t)
sympy.pretty_print(t9)
println("n is an integer, thus starting with 0, we will use 129.66 years as the answer when the population reach 9 billion")

plot(yt_final, 0,500,
	legend=:bottomright, bottom_margin=5mm, 
	left_margin=5mm,
	xformatter = x->string(Int(x+1925)," "),
	xlabel="years", ylabel="population (in billion)",
	label=L"y(t) = \frac{16}{1 + 7 e^{- \left( \frac{1}{50} \ln \frac{7}{3} \right) t }}",
	size=(720, 360), tickfontsize=10)
