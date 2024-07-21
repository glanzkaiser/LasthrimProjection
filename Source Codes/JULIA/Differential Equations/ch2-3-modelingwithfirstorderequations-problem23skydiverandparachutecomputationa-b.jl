using SymPy, Plots
@syms t, α, ts
@syms v()

# Computing IVP with SymPy
v(t).diff(t) 
diffeq = Eq(v(t).diff(t), -(v(t)/7.5) + 32); string(diffeq)

# To solve the ODE, pass it and the function to solve for to dsolve.
vt = dsolve(diffeq, v(t))
# To solve the Initial Value Problem, initial velocity is 0 ft/s
ivp = dsolve(diffeq, v(t), ics = Dict(v(0) => 0))
xt = integrate(ivp,(t,0,t))

println("Modeling with First Order Equations with Julia")
println("Sky Diver Falls Vertically with Parachute")
println("A Sky Diver weighing 180 lb falls vertically")
println("From altitude of 5000 ft and opens the parachute after 10 s")
println("Assumed that the force of air resistance is 0.75|v| when the parachute is closed")
println("Assumed that the force of air resistance is 12|v| when the parachute is open")

println("")
println("The speed of the sky diver when the parachute opens: ")
println(ivp(10), "ft/s")

println("")
println("The distance fallen before the parachute opens: ")
println(xt(10), " ft")

println("")
println("The speed of the sky diver when the parachute opens: ")
ivp