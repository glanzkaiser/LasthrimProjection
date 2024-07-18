using CalculusWithJulia

# For partition of 8
ns = (9)

# Define the function, the partitions, and the interval 
f(x) = x^(4)
a = 1
b = 3
n = 8
h = (b-a)/n
g = (((f'(b)-f'(a))*h^2)/12) # the Modified Trapezoid

function riemann(M, f, a, b, n)
    xs = range(a,b,n)
    riemann(M, f, xs[1:end-1], xs[2:end])
end
riemann(M, f, as, bs) = sum(M(f,a,b) * (b-a) for (a,b) in zip(as, bs))

# The formula used to add the terms is: 
# sum(M(f,a,b) * (b-a) 
# for (a,b) in zip(as, bs)) has a factor h in the (b-a) term, 
# so you only have one h in the formula, not h^2.

Ms = (left = (f,a,b) -> f(a),
      right= (f,a,b) -> f(b),
      midpoint  = (f,a,b) -> f(a/2 + b/2),
      #m̃    = (f,a,b) -> first(findmin(f, range(a,b,10))),
      #M̃    = (f,a,b) -> first(findmax(f, range(a,b,10))),
      trapezoid = (f,a,b) -> (f(a) + f(b))/2,
      modifiedtrapezoid = (f,a,b)-> (c = a/2+b/2; (f(a)+f(b))/2 - 1/12 * (f'(b)-f'(a))*(b-a)),
      simpsons  = (f,a,b) -> (c = a/2 + b/2;(1/6) * (f(a) + 4*f(c) + f(b)))
      )

using DataFrames
d = DataFrame(n = Int[], M = Symbol[], value = Float64[])
for (m,M) in pairs(Ms)
    for n in ns
        v = riemann(M, f, a, b, n)
        push!(d, (n=n-1, M=m, value=v))
    end
end
  
unstack(d, :n, :value)