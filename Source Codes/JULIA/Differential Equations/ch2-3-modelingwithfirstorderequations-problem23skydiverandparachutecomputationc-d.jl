using SymPy, Plots
@syms t, α, ts
@syms v()

# Computing IVP with SymPy
v(t).diff(t) 
diffeq = Eq(v(t).diff(t), -(32v(t)/15) + 32); string(diffeq)

# To solve the ODE, pass it and the function to solve for to dsolve.
vt = dsolve(diffeq, v(t))
# To solve the Initial Value Problem, initial velocity is 176.7 ft/s
ivp = dsolve(diffeq, v(t), ics = Dict(v(0) => 176.7))
#xt = integrate(ivp,(t,0,t))
xt = 15t - 75.8*exp(-32t/15) + 1150.3
d = solve(15t - 75.8*exp(-32t/15) + 1150.3~5000,t)
println("Modeling with First Order Equations with Julia")
println("Sky Diver Falls Vertically with Parachute")
println("A Sky Diver weighing 180 lb falls vertically")
println("From altitude of 5000 ft and opens the parachute after 10 s")
println("Assumed that the force of air resistance is 0.75|v| when the parachute is closed")
println("Assumed that the force of air resistance is 12|v| when the parachute is open")

println("")
println("The limiting velocity after the parachute opens: ")
println(ivp(oo), "ft/s")

println("")
println("The distance fallen after the parachute opens: ")
println(xt)

println("")
println("The duration of the sky diver in the air after the parachute opens: ")
println(d)

println("")
println("The speed of the sky diver after the parachute opens: ")
ivp