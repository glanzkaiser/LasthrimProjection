using IntervalArithmetic, IntervalRootFinding

f(x) = sin(x) - 0.1*x^2 + 1
roots(f, -10..10)