using SymPy
@syms t, c
@syms f()
# make the differential equations in form of:
# dy/dt + p(t)y = g(t)
# μ(t) = exp(integrate(p(t) dt))
# y(t) = 1/μ(t) * (integrate((μ(s) * g(s)), (s,t0,t)) + c)
# the initial value condition is y(0) = 2
p(t) = -4t^0
g(t) = exp(4t)
μ(t) = exp(integrate(p(t),t))
int = integrate((μ(t)*g(t)),t)
y(t) = (1/μ(t))*( int + c)

# Computing IVP with SymPy
f(t).diff(t) # Derivatives of f(t) are unevaluated
diffeq = Eq(f(t).diff(t) - 4*f(t), exp(4t)); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
ft = dsolve(diffeq, f(t))
# To solve the Initial Value Problem f(0) = 2
ivp = dsolve(diffeq, f(t), ics = Dict(f(0) => 2))

println("Method of Integrating Factors with Julia")
println("The differential equation: y' + ", p(t)," y = ", g(t))

println("")
println("μ(t) = ", simplify(μ(t)))

println("")
println("The general solution is")
print("y(t) = ",y(t))
println("")

c = solve(y(t)~2,c) # substitute y(0)=2 and solve it for c

println("The initial value condition y(0) = 2 resulting in")
println("c = ", c[1], " = ", c[1](0))
println("")

println("Hence, the specific solution is")
println("y(t) = ", ivp)
