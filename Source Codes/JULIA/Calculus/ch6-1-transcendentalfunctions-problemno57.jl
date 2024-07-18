using SymPy, IntervalArithmetic, IntervalRootFinding
@syms x

v1(x) = log(1.5 + sin(x))
v2(x) = cos(x)/(1.5 + sin(x))
v3(x) = -((sin(x))/(sin(x)+1.5)) - (0.4444 * cos(x)^2)/((2/3*sin(x) + 1)^2)

vd = diff((v1(x)), (x))
vdd = simplify(diff((vd), (x)))
V1 = IntervalRootFinding.roots(v2, -5..5)
V_inflect = IntervalRootFinding.roots(v3, 0..3pi)

println("Computing with Julia")
println("f'(x) = ", vd)
println("f''(x) = ", vdd)

println("a. absolute extreme points: ")
println(V1)

println("b. f''(x) = 0 at x: ")
println(V_inflect)
println("thus, the inflection points are: ")
println("(3,871, ", f(3.871), ")")
println("(5.55351, ", f(5.55351), ")")

println("c.")
print(integrate(log(1.5 + sin(x)),(x,0,3π)))
print(" ")
print("≈ ")
println(integrate(log(1.5 + sin(x)),(x,0,3π)).evalf())