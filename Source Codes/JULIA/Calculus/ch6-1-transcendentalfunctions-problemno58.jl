using SymPy, IntervalArithmetic, IntervalRootFinding
@syms x

v1(x) = cos(log(x))
v2(x) = -sin(log(x))/x
v3(x) = sin(log(x))/(x^2) - cos(log(x))/(x^2)

vd = diff((v1(x)), (x))
vdd = simplify(diff((vd), (x)))
V1 = IntervalRootFinding.roots(v2, 0.1..20)
V2 = IntervalRootFinding.roots(v2, 0.01..20)
V_inflect = IntervalRootFinding.roots(v3, 0..3pi)

println("Computing with Julia")
println("f'(x) = ", vd)
println("f''(x) = ", vdd)

println("a. absolute extreme points on [0.1,20] : ")
println(V1)

println("b. absolute extreme points on [0.01,20] : ")
println(V1)

println("c.")
print(integrate(cos(log(x))),(x,0.1,20))
print(" ")
print("≈ ")
println(integrate(cos(log(x)),(x,0.1,20)).evalf())

