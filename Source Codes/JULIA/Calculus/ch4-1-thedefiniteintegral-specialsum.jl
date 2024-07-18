using Symbolics, Polynomials
@variables n i 

a = [1 n*(n+1)/2 n*(n+1)*(2n+1)/6 (1/4)*(n*(n+1))^2 (n*(n+1)*(2n+1)*(3n^2 + 3n - 1))/30]

pad(v,n) = (L = length(v) ; [i <= L ? v[i] : zero(eltype(v)) for i in 1:n] )

# 1 + 2i -> Polynomial([1,2,0,0], :i)
# 3i^2 + i^4 -> Polynomial([0,0,3,0,1], :i)
# i^2 - 3i - 10 -> Polynomial([-10,-3,1,0,0], :i)

p = Polynomial([-10,-3,1,0,0], :i)

# coeffs(p) -> returns the entire coefficient vector
# Polynomials.degree(p) -> returns the polynomial degree, length is 1 plus the degree
println("The special sum for $p is")

a*(pad(coeffs(p),5))

#collect(Polynomials.monomials(p))

