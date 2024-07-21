using SymPy
@syms x, y, c
@syms f()
# Separable equations for general first order equation
# dy/dx = f(x,y)
# make the differential equations in form of:
# M(x) + N(y) dy/dx = 0
m(x) = -3x^2-4x-2
n(y) = 2*(y-1)
s1(x) = integrate(m(x),x)
s2(y) = integrate(n(y),y)

# Computing IVP with SymPy
f(x).diff(x) 
diffeq = Eq(f(x).diff(x), (3x^2 + 4x+2)/(2*(f(x)-1))); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
fx = dsolve(diffeq, f(x))
# To solve the Initial Value Problem f(0) = -1
ivp = dsolve(diffeq, f(x), ics = Dict(f(0) => -1))

println("Method of Separable Equations with Julia")
println("The differential equation: ", m(x)," + ", n(y), " dy/dx")

println("")
println("The equation for the integral curves: ")
print(simplify(s1(x) + s2(y)), " = c")
println("")

println("")
println("The explicit solution is: ")
ivp
