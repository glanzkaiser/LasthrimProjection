# https://discourse.julialang.org/t/is-there-package-or-method-to-calculate-certain-area-in-julia-symbolically-with-sympy/99751/4

using PolygonArea, Plots, LaTeXStrings

c1 = circle((0.9, 1), 2, 100)  # Actually, a regular 100-gon
c2 = circle((0.9, -1), 2*sqrt(2), 100)  # Actually, a regular 100-gon

plot(c1)
plot!(c2)
plot!(c2 ∩ c1, color=:green) 

plot!([0.9,0.9],[-1,3], label="", linecolor=:black, linestyle=:dash)
plot!([-1.1,2.9],[1,1], label="", linecolor=:black, linestyle=:dash)

plot!([0.9,2.9],[-1,1], label=L"\sqrt{2} a", linecolor=:blue2)
plot!([-1.1,0.9],[1,-1], label="", linecolor=:blue2)

scatter!([0.9], [1], color = "black", label="", markersize = 3)
scatter!([0.9], [-1], color = "black", label="", markersize = 3)
scatter!([-1.1], [1], color = "black", label="", markersize = 3)
scatter!([2.9], [1], color = "black", label="", markersize = 3)

annotate!([(1.1,1.4, (L"O", 10, :black)),
		   (-1.3,1.23, (L"A", 10, :black)),
		   (3.1,1.23, (L"B", 10, :black)),
		   (0.9,-1.4, (L"C", 10, :black)),
		   (1.9,1.23, (L"a", 10, :black)),
		   (1.6,0.05, (L"\sqrt{2} a", 10, :blue)),
		   (0.7,-0.1, (L"a", 10, :black))])
