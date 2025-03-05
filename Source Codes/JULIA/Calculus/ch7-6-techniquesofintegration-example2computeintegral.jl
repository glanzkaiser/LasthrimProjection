using SymPy, LaTeXStrings

x = symbols("x")

# To calculate the integral between interval [-2,2]
m = integrate(sin(x^2), (x, 0, sqrt(pi)))
My = integrate(x*sin(x^2), (x, 0, sqrt(pi)))
Mx = integrate(0.5*(sin(x^2))^2, (x, 0, sqrt(pi)))

println("m  = ", m.evalf())
println("M_{y}  = ", My.evalf())
println("M_{x}  = ", Mx.evalf())

println("x_bar  = ", (My/m).evalf())
println("y_bar  = ", (Mx/m).evalf())