
# This function is defined in MTH229
function riemann(f::Function, a::Real, b::Real, n::Int; method="right")
  if method == "right"
     meth = (f,l,r) -> f(r) * (r-l)
  elseif method == "left"
     meth= (f,l,r) -> f(l) * (r-l)
  elseif method == "trapezoid"
     meth = (f,l,r) -> (1/2) * (f(l) + f(r)) * (r-l)
  elseif method == "simpsons"
     meth = (f,l,r) -> (1/6) * (f(l) + 4*(f((l+r)/2)) + f(r)) * (r-l)
  end

  xs = range(a, b, length=n+1)
  lrs = zip(Iterators.take(xs, n), Iterators.rest(xs, 1))
  sum(meth(f, l, r) for (l,r) in lrs)

end


f(x) =  exp(-x^2)
# we approximate the integral of f(x) from 0 to 3 using 10,000 subintervals
riemann(f, 0, 3, 10_000)

# compare different intervals (or use 10.^(2:5))
[riemann(f, 0, 3, n) for n in [100, 1000, 10000, 100000]] 

# compare right and left Riemann sums
ns = [10^i for i in 1:5]
ys = [riemann(f, 0, 2, n, method="right") - riemann(f, 0, 2, n, method="left") for n in ns];
[ns ys]

# try other method
riemann(f, 0, 1, 1000, method="trapezoid")

# Compare the error with the left Riemann sum and Trapezoid
ns = [10^i for i in 1:5]
left_r = [riemann(f, 0, 1, n) for n in ns];
trapezoid_r = [riemann(f, 0, 1, n, method="trapezoid") for n in ns];
[ns (1).-left_r (1).-trapezoid_r]