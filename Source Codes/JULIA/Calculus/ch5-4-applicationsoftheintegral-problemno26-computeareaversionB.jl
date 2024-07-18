using ForwardDiff: derivative
using QuadGK

x = symbols("x")

f(x) = (x^6 + 2)/(8x^2)
A(x) = 2π * f(x) * sqrt(1 + derivative(f, x)^2)

d = quadgk(A, 1, 3; rtol=1e-10)
dq = 2π*quadgk(h, 1, 3)[1]

println("(Area, error) = ", d)

println("Area with QuadGK = ", dq)

# check
# @btime quadgk(A, 1, 3, rtol=1e-10)