using SymPy
@syms t, c
@syms f()
# make the differential equations in form of:
# dy/dt + p(t)y = g(t)
# μ(t) = exp(integrate(p(t) dt))
# y(t) = 1/μ(t) * (integrate((μ(s) * g(s)), (s,t0,t)) + c)
# the initial value condition is y(π) = 0
p(t) = 2/t
g(t) = cos(t)/t^2
μ(t) = exp(integrate(p(t),t))
int = integrate((μ(t)*g(t)),t)
y(t) = (1/μ(t))*( int + c)

# Computing IVP with SymPy
f(t).diff(t) # Derivatives of f(t) are unevaluated
diffeq = Eq(f(t).diff(t) + (2/t)*f(t), cos(t)/(t^2)); string(diffeq)
# To solve the ODE, pass it and the function to solve for to dsolve.
ft = dsolve(diffeq, f(t))
# To solve the Initial Value Problem f(π) = 0
ivp = dsolve(diffeq, f(t), ics = Dict(f(pi) => 0))

println("Method of Integrating Factors with Julia")
println("The differential equation: y' + ", p(t)," y = ", g(t))

println("")
println("μ(t) = ", simplify(μ(t)))

println("")
println("The general solution is")
print("y(t) = ",y(t))
println("")

c = solve(y(t)~0,c) # substitute y(π)=0 and solve it for c

println("The initial value condition y(π) = 0 resulting in")
println("c = ", c[1], " = ", c[1](pi))
println("")

println("Hence, the specific solution is")
println("y(t) = ", ivp)
