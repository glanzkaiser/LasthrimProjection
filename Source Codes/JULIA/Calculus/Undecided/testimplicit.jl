# https://discourse.julialang.org/t/is-there-package-or-method-to-calculate-certain-area-in-julia-symbolically-with-sympy/99751/4

using SymPy, Plots
f(x,y) = (4*x^2)+(9*y^2)-36
g(x,y) =(5*x^2) - 4*x*y + (8*y^2)-36

#plot((g ≦ 0) & (f ≫ 0) , fc=:black, widen=false, aspect_ratio=:equal)  
implicit_plot(g)