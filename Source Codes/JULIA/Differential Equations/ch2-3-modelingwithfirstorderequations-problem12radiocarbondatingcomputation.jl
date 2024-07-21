using SymPy, Plots
@syms q, t, r
@syms q()

# Computing IVP with SymPy
q(t).diff(t) 
diffeq = Eq(q(t).diff(t), -r*q(t) ); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
qt = dsolve(diffeq, q(t))
# To solve the Initial Value Problem q(0) = 1
ivp = dsolve(diffeq, q(t), ics = Dict(q(0) => 1))

remains = 20/100 # 20% remains
halflife = 5730
rate = log(1/2)/(-halflife)
age = log(remains)/(-rate)

println("Modeling with First Order Equations with Julia")
println("Radiocarbon Dating of carbon-14")

println("")
println("The half-life for Carbon-14: ", halflife, " years")
println("The decay constant r for Carbon-14: ", rate)

println("")
println("If the current residual amount of carbon-14 is 20% ")
println("Then the age of the remains is: ", age, " years")

println("")
println("The general solution / The amount of carbon-14 left after time t is: ")
ivp(Dict(r => rate))