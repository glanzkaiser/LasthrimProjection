using SymPy, LaTeXStrings,Plots,PrettyTables
@syms x,y,c
@syms y()

println("First-Order Linear Differential Equations with Julia")
println("y' = 1/5xy is the differential equation")
println("")

p1(x) = (-1/5)*x
g1(x) = 0
μ1(x) = exp(integrate(p1(x),x))
y1(x) = (1/μ1(x))*( integrate((μ1(x)*g1(x)),x) + c)

println("The general solution:  ")
sympy.pretty_print(y1(x))
println("")
