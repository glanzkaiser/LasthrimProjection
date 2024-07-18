# https://discourse.julialang.org/t/is-there-package-or-method-to-calculate-certain-area-in-julia-symbolically-with-sympy/99751/4

using PolygonArea, Plots

r = rectangle((0.0, 0.0), (1.0, 1.0))

c1 = circle((0.9, 1.5), 1.5, 100)  # Actually, a regular 100-gon
c2 = circle((0.9, 3), 2, 100)  # Actually, a regular 100-gon

cinter = c1 ∩ c2
#a = area(c1 ∩ c2)
#println("area =   ", a)
#plot(c2)
#plot!(c1, color=:green)


plot(c2 \ c1, color=:green) 
#area(c1) - area(c1 ∩ c2)