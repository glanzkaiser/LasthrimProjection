using SymPy, Plots
@syms x

N = 8
g = sum((2/n)*((-1)^(n+1))*(sin(n*x)) for n in 1:N)

# f(x) = (2/n)*((-1)^(n+1))*(sin(n*x))
# sum(f(x) for n in 1:3)

plot(g)