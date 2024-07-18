function riemann(M, f, a, b, n)
    xs = range(a,b,n)
    riemann(M, f, xs[1:end-1], xs[2:end])
end
riemann(M, f, as, bs) = sum(M(f,a,b) * (b-a) for (a,b) in zip(as, bs))

Ms = (left = (f,a,b) -> f(a),
      right= (f,a,b) -> f(b),
      midpoint  = (f,a,b) -> f(a/2 + b/2),
      #m̃    = (f,a,b) -> first(findmin(f, range(a,b,10))),
      #M̃    = (f,a,b) -> first(findmax(f, range(a,b,10))),
      trapezoid = (f,a,b) -> (f(a) + f(b))/2,
      simpsons  = (f,a,b) -> (c = a/2 + b/2;(1/6) * (f(a) + 4*f(c) + f(b)))
      )

# For partition of 4, 8, and 16
ns = (5, 9, 17)

# Define the function
f(x) = x*sqrt(x^3 + 1)

using DataFrames
d = DataFrame(n = Int[], M = Symbol[], value = Float64[])
for (m,M) in pairs(Ms)
    for n in ns
        v = riemann(M, f, 1, 3, n)
        push!(d, (n=n-1, M=m, value=v))
    end
end
  
unstack(d, :n, :value)