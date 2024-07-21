using SymPy
@syms Q0, r, t
@syms q()

# The Water Tank Problem
# At time t=0 a tank contains Q0 lb of salt dissolved in 100 gal of water
# Assume the water containing 1/4 lb of salt/gal is entering the tank at a rate r gal/min
# the well-stirred mixture is draining from the tank at the same rate
# Computing IVP with SymPy
q(t).diff(t) 
diffeq = Eq(q(t).diff(t), r/4 - r*q(t)/100 ); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
qt = dsolve(diffeq, q(t))
# To solve the Initial Value Problem q(0) = Q0
ivp = dsolve(diffeq, q(t), ics = Dict(q(0) => Q0))

println("Modeling with First Order Equations with Julia")
println("The Water Tank Problem")
println("At time t=0 a tank contains Q0 lb of salt dissolved in 100 gal of water")
println("Assume the water containing 1/4 lb of salt/gal is entering the tank at a rate r gal/min")
println("the well-stirred mixture is draining from the tank at the same rate")

println("")
println("The amount of salt Q(t) at any time is: ")
ivp

# sympy.classify_ode(diffeq)
