# https://discourse.julialang.org/t/is-there-package-or-method-to-calculate-certain-area-in-julia-symbolically-with-sympy/99751/4

using PolygonArea, Plots, LaTeXStrings

c1 = circle((0.9, 1.7), 2, 100)  # Actually, a regular 100-gon
c2 = circle((0.9, -1), 2*sqrt(2), 100)  # Actually, a regular 100-gon

plot(c1)
plot!(c2)
plot!(c2 ∩ c1, color=:green) 

plot!([0.9,0.9],[-1,1], label="", linecolor=:black, linestyle=:dash)
plot!([-1.05,2.85],[1.1,1.1], label="", linecolor=:black, linestyle=:dash)

plot!([3.5,0.9],[-2,-1], label="", linecolor=:blue2)

scatter!([0.9], [1.1], color = "black", label="", markersize = 3)
scatter!([0.9], [-1], color = "black", label="", markersize = 3)

annotate!([(1,1.4, (L"O", 10, :black)),
		   (0.9,-1.4, (L"C", 10, :black)),
		   (2.6,-1.35, (L"b", 10, :blue)),
		   (1.9,1.4, (L"a", 10, :black))])
