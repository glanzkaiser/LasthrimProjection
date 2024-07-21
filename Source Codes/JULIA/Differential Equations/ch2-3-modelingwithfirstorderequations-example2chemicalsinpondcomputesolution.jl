using SymPy, Plots
@syms q, t
@syms q()

# Computing IVP with SymPy
q(t).diff(t) 
diffeq = Eq(q(t).diff(t), 10 + 5*sin(2t) - 1/2*q(t) ); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
qt = dsolve(diffeq, q(t))
# To solve the Initial Value Problem q(0) = 0
ivp = dsolve(diffeq, q(t), ics = Dict(q(0) => 0))

println("Modeling with First Order Equations with Julia")
println("Chemicals in a Pond")

println("")
println("The amount of chemicals in a pond at time t is: ")
ivp
