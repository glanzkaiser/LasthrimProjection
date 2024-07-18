using SymPy

a, b = 1, 6

@syms x, c, d, y 

# y = 1/x^2 -> x = 1/sqrt(y)

A = integrate(1/x^2, (x, a, b))

# Find c
solve(integrate(1/x^2, (x, a, c)) ~ A/2, c)

# Find d
solve(integrate(1/sqrt(y), (y, d, 1)) ~ A/2)
