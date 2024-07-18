using SymPy

x = symbols("x")

# To calculate the integral between interval [-2,2]
fc = integrate(abs(x), (x, -2, 2))

# keep Float type 
function square_root(x)
           return (sqrt(x), -sqrt(x))
end

# allow for loss of precision by returning as an Integer
function square_root_trunc(x)
           truncated_result = trunc(Int, sqrt(x))
           return (truncated_result, -truncated_result)
end

# Find the values of c that satisfy the Mean Value Theorem for Integrals
# since f(x) = |x|, then f(c) = |c|
c = fc/(2-(-2))
println("f(c) = |c| = ", c)

println("c = ", square_root(c))
