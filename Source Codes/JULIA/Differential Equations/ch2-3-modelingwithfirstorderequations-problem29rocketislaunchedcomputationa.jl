using SymPy, Plots
@syms x, G, g, R, M, m
@syms v()

# Computing IVP with SymPy
v(x).diff(x) 
diffeq = Eq(m*v(x)*v(x).diff(x), -G*(M*m/(R+x)^2)); string(diffeq)

# To solve the ODE, pass it and the function to solve for to dsolve.
vx = dsolve(diffeq, v(x))
# To solve the Initial Value Problem, initial velocity is sqrt(2*g*R)
ivp = dsolve(diffeq, v(x), ics = Dict(v(0) => sqrt(2*g*R) ))

println("Modeling with First Order Equations with Julia")
println("A Rocket is Launched straight up from the surface of the earth")
println("Neglect air resistance")
println("v(0) = sqrt(2gR)")
println("g = GM/(R^2)")
println("g = 78,545 mi/hr^2")

println("")
println("The velocity (in mi/hr) in terms of the distance x: ")
ivp[2](Dict(g => G*M/(R^2) ))
