# https://discourse.julialang.org/t/is-there-package-or-method-to-calculate-certain-area-in-julia-symbolically-with-sympy/99751/4

using ImplicitEquations, Plots
f(x,y) = (x-2)^2+(y)^2-3.0^2
g(x,y) = (x+2)^2+(y)^2-3.0^2

plot((f ≦ 0) & (g ≦ 0), xlims=(-6,6),
	fc=:green, widen=false, aspect_ratio=:equal, framestyle=:zerolines)  
#plot!((g≦0), xlims=(-6,6),
#	fc=:blue, widen=false, aspect_ratio=:equal, framestyle=:zerolines)  
#plot!((f≦0), xlims=(-6,6),
#	fc=:blue, widen=false, aspect_ratio=:equal, framestyle=:zerolines)  

#plot((g ≦ 0) & (f ≫ 0) , fc=:black, widen=false, aspect_ratio=:equal, framestyle=:zerolines)  

#=

using PolygonArea, Plots

r = rectangle((0.0, 0.0), (1.0, 1.0))

c1 = circle((-0.9, 1), 2, 100)  # Actually, a regular 100-gon
c2 = circle((0.9, 1), 2, 100)  # Actually, a regular 100-gon

plot(c2 ∩ c1, color=:green) 
#plot(c2 \ c1, color=:green) 
=#