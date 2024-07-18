using CalculusWithJulia

# The formula
function riemann(f, a, b, n; method="right")
  xs = a:(b-a)/n:b
  deltas = diff(xs)      # forms x2-x1, x3-x2, ..., xn-xn-1
  if method == "left"
    cs = xs[1:end-1]
  elseif method == "right"
    cs = xs[2:end]
  else
    cs = [(xs[i] + xs[i+1])/2 for i in 1:length(deltas)]
  end
  sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
end

# the function
f(x) = 3(x)^2 + x + 1
#number of partitions

# print the result
println("The area for $f(x):")
#The left rectangle is a left sum, the right rectangle is a right sum
riemann(f, -1, 0, 5; method="left") + riemann(f, 0, 1, 5; method="right")
