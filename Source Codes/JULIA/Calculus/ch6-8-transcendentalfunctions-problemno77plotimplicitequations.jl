# https://discourse.julialang.org/t/is-there-package-or-method-to-calculate-certain-area-in-julia-symbolically-with-sympy/99751/4

using ImplicitEquations, Plots
f(x,y) = (x-0.9)^2+(y-1.5)^2-1.5^2
g(x,y) = (x-0.9)^2+(y-3.)^2-2.0^2

plot((g ≦ 0) & (f ≫ 0) , fc=:black, widen=false, aspect_ratio=:equal)  