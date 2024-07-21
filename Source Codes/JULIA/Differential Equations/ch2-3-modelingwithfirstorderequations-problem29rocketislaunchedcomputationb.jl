using SymPy
@syms t, g, R
@syms x()

# Computing IVP with SymPy
diffeq = diff(x(t), t) - √(2g) * R / √(R + x(t))

# To solve the ODE, pass it and the function to solve with dsolve.
xt = dsolve(diffeq)

# To solve the Initial Value Problem, initial condition is 0
sol_xt = rhs(xt[3])
c1 = free_symbols(sol_xt)[1]
t1 = free_symbols(sol_xt)[4]

C1 = solve(sol_xt(t=>0) ~ 0, c1)[2]
T1 = solve(sol_xt(c1=>C1) + 4000 ~ 240000, t1)[2]

ivp = sol_xt(c1=>C1)
#ivp = sol_xt(c1=>C1,R => 4000, g => 78545)

println("Modeling with First Order Equations with Julia")
println("A Rocket is Launched straight up from the surface of the earth")
println("Neglect air resistance")
println("The initial condition: x(0) = 0")
println("g = GM/(R^2)")
println("g = 78,545 mi/hr^2")

println("")
println("The time required for the rocket to go 240,000 miles (in hours): ")
println(T1(R => 4000, g => 78545).evalf())

println("")
println("The initial value problem solution is:")
println("x(t) = ")
ivp


