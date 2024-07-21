using SymPy
@syms x, y, c
@syms f()
# Separable equations for general first order equation
# dy/dx = f(x,y)
# make the differential equations in form of:
# M(x) + N(y) dy/dx = 0
m(x) = -x^2
n(y) = 1 - y^2
s1(x) = integrate(m(x),x)
s2(y) = integrate(n(y),y)

println("Method of Separable Equations with Julia")
println("The differential equation: ", m(x)," + ", n(y), " dy/dx")

println("")
println("The equation for the integral curves: ")
print(simplify(s1(x) + s2(y)), " = c")
println("")

println("")
println("The explicit solution is: ")
ivp
