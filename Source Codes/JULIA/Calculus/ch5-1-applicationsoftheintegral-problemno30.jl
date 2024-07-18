using ImplicitEquations, Plots, LaTeXStrings, Roots, SymPy
gr()

f1(x,y) = (-3x + 21)/6  # a line connecting (-1,4) and (5,1)
f2(x,y) = -2x + 2 # a line connecting (-1,4) and (2,-2)
f3(x,y) = x - 4 # a line connecting (5,1) and (2,-2)
f4(x,y) = y

plot([-1,2],[4,-2], label="", linecolor=:green)
plot!([-1,5],[4,1], label="", linecolor=:green)
plot!([5,2],[1,-2], label="", linecolor=:green)

scatter!([-1], [4], color = "red1", label="", markersize = 3)
scatter!([2], [-2], color = "red1", label="", markersize = 3)
scatter!([5], [1], color = "red1", label="", markersize = 3)

plot!((f4 ≦ f1) & (f4 ≧ f2) & (f4 ≧ f3),
	xlims=(-2,6), ylims=(-6,6), fc=:blues, 
	label="", widen=false)     

#=
# To calculate the area 1
h(x) = 3x/2 + 3/2
integrate(h,-1,2).evalf()
# To calculate the area 2
k(x) = -3x/2 + 15/2
integrate(k,2,5).evalf()
# Total area
integrate(h,-1,2).evalf() + integrate(k,2,5).evalf()
=#