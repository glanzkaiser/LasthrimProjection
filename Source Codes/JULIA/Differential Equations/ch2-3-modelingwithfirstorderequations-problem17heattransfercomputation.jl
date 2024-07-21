using SymPy, Plots
@syms t, α, ts
@syms u()

# Computing IVP with SymPy
u(t).diff(t) 
diffeq = Eq(u(t).diff(t), -α*(u(t))^4 ); string(diffeq)
diffeq2 = Eq(u(t).diff(t), -α*((u(t))^4 - ts(t)^4) ); string(diffeq2)

# To solve the ODE, pass it and the function to solve for to dsolve.
ut = dsolve(diffeq, u(t))
# To solve the Initial Value Problem, initial temperature is 2000 K
ivp = dsolve(diffeq, u(t), ics = Dict(u(0) => 2000))
#ivp2 = dsolve(diffeq2, u(t), ics = Dict(u(0) => 2000)) cannot be computed

yt = cbrt(1/(6e-12t + 1/8000000000))

println("Modeling with First Order Equations with Julia")
println("Heat transfer from a body to its surrounding")

println("")
println("The time when the body temperature is 600 K: ")
println(solve(yt~600,t)[1])

println("")
println("The temperature of the body at any time is: ")
ivp(Dict(α => 2e-12))