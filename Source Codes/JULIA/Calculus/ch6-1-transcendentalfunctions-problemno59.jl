using SymPy, IntervalArithmetic, IntervalRootFinding, PrettyTables
@syms x

f(x) = x*(log(1/x))
g(x) = (x^2)*(log(1/x))
ar(x) = abs(f(x)-g(x))
fd = diff(f(x), x)
gd = diff(g(x), x)

ard(x) = diff(ar(x), x)
#V1 = IntervalRootFinding.roots(ard, 0..1)

println("Computing with Julia")
println("f'(x) = ", fd)
println("g'(x) = ", gd)
println("")

println("a. the area of the region between the curves on (0,1] : ")
# integrate(abs(f(x)-g(x)),(x,0,1))
print(integrate(ar(x),(x,0,1))) 
print("≈ ")
println(integrate(ar(x),(x,0,1)).evalf())
println("")

println("b. absolute maximum value of |f(x) - g(x)| on (0,1] : ")
#println(V1)
println("critical points: 0.260, 1")
println("f(0.236) ≈ ", f(0.236))
println("f(1) = ", f(1))
println("g(0.236) ≈ ", g(0.236))
println("g(1) = ", g(1))
println("")

println("maximum value point of |f(x) - g(x)| on (0,1]: (0.236,", f(0.236) - g(0.236), ")")

# Uncomment this to see the table
# Alternative 1: Pretty Tables

println(pretty_table(String, 
 	 vcat([[string(t) f(t) g(t) fd(t) gd(t) abs(f(t)-g(t)) ] for t in 0:0.05:1]...); 
  	header=["x", "f(x)", "g(x)", "f'(x)", "g'(x)", "|f(x)-g(x)|" ]))

println(pretty_table(String, 
 	 vcat([[string(t) f(t) g(t) fd(t) gd(t) abs(f(t)-g(t)) ] for t in 0.23:0.001:0.24]...); 
  	header=["x", "f(x)", "g(x)", "f'(x)", "g'(x)", "|f(x)-g(x)|" ]))
