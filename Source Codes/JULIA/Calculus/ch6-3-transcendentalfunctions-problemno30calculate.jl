using SymPy, IntervalArithmetic, IntervalRootFinding
@syms x

v1(x) = log(2x - 1)
v2(x) = (2)/(2x - 1)
v3(x) = (-4)/((2x - 1)^2)

# Find the derivative of v1
vd = diff((v1(x)), (x))
vdd = simplify(diff((vd), (x)))

V1 = solve(v2(x), x)
V_inflect = IntervalRootFinding.roots(v3, -3pi..3pi)

println("Computing with Julia")
println("f'(x) = ", simplify(vd))
println("f''(x) = ", vdd)

println("")
println("Absolute extreme points: ")
println(V1)
println("check around this point to see whether it is a maximum or minimum point.")
println(" If f'(x-c) < 0 and f'(x+c) > 0 then x is a minimum")
println(" If f'(x-c) > 0 and f'(x+c) < 0 then x is a maximum")
println(" If there is no extreme points, then f and f' is monotonic")

println("")
println(" Check concavity with : ")
println(" f''(x) = 0 at x: ")
println(V_inflect)
println(" If f''(c) < 0 then it is concave down at that interval")
println(" If f''(c) > 0 then it is concave up at that interval")
