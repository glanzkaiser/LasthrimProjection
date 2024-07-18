using SymPy, LaTeXStrings,Plots,PrettyTables
@syms x,y,c
@syms f()

println("First-Order Linear Differential Equations with Julia")
println("y' = 0.2y(16-y) is the differential equation")
println("")

p1(x) = -(3.2-0.2y)*x^0
g1(x) = 0
μ1(x) = exp(integrate(p1(x),x))
y1(x) = (1/μ1(x))*(integrate((μ1(x)*g1(x)),x) + c)

println("The general solution:  ")
sympy.pretty_print(y1(x))
println("")


# Computing IVP with SymPy
diffeqf = Eq(f(x).diff(x) -(3.2 -0.2f(x))*x^0, g1(x)); string(diffeqf)
ivp_f = dsolve(diffeqf, f(x), ics = Dict(f(0) => 3))

println("the particular solution for y(0) = 3:  ")
sympy.pretty_print(ivp_f)

#plot(ivp_f,0,100)