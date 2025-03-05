# https://discourse.julialang.org/t/how-to-create-a-3d-transparent-cylinder-with-glmakie-or-plots-if-possible/92099/9

using GLMakie

h = 3
r = 5
n = 50
θ = LinRange(0, 2pi, 100)
#θ = [0;(0.5:n-0.5)/n;2π]
v = [0;(1:n)/n;h]
x = [r*cos(θ) for θ in θ, _ in v]
y = [r*sin(θ) for θ in θ, _ in v]
z = [v for _ in θ, v in v]
surface(x, y, z)