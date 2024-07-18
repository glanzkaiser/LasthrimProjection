#This investigates the right limit, as the values chosen for xs are always more than 2 but getting closer.

hs = [1/10, 1/100, 1/1000, 1/10000, 1/100000]  # or [1/10^i for i in 1:5]
xs = 2 .+ hs

f(x) = ((x+2)*(x-3)) / ((x+2)*(x+3))
ys = f.(xs)

println("c \t lim(x → c) f(x)")
[xs ys]
