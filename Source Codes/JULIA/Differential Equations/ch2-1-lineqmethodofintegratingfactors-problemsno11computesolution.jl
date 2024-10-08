using SymPy
@syms t, c

# make the differential equations in form of:
# dy/dt + p(t)y = g(t)
# μ(t) = exp(integrate(p(t) dt))
# y(t) = 1/μ(t) * (integrate((μ(s) * g(s)), (s,t0,t)) + c)
p(t) = t^0
g(t) = 5sin(2t)
μ(t) = exp(integrate(p(t),t))
y(t) = (1/μ(t))*( integrate((μ(t)*g(t)),t) + c)

println("Method of Integrating Factors with Julia")
println("The differential equation: y' + ", p(t)," y = ", g(t))

println("")
println("μ(t) = ", simplify(μ(t)))

println("")
println("The general solution is")
print("y(t) = ",y(t))
