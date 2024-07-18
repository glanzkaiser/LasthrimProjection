using ImplicitEquations, Plots, LaTeXStrings, Roots, SymPy
gr()

f1(x,y) = 9  # a line connecting (-3,9) and (3,9)
f2(x,y) = x + 6 # a line connecting (3,9) and (-2,4)  
f3(x,y) = -x + 6 # a line connecting (-3,9) and (2,4)
f4(x,y) = x^(2)
f5(x,y) = y
f(x) = x^2

plot([-3,3],[9,9], label="", linecolor=:green)
plot!([-3,2],[9,4], label="", linecolor=:green)
plot!([-2,3],[4,9], label="", linecolor=:green)
plot!(f, label=L"x^{2}", linecolor=:black)

scatter!([-3], [9], color = "blue1", label="", markersize = 4)
scatter!([3], [9], color = "blue1", label="", markersize = 4)
scatter!([-2], [4], color = "blue1", label="", markersize = 4)
scatter!([2], [4], color = "blue1", label="", markersize = 4)

annotate!([(-3.6,9, (L"(-3,9)", 10, :black))])
annotate!([(3.6,9, (L"(3,9)", 10, :black))])
annotate!([(-2.6,4, (L"(-2,4)", 10, :black))])
annotate!([(2.6,4, (L"(2,4)", 10, :black))])

# Region A
plot!((f5 ≦ f1) & (f5 ≧ f2) & (f5 ≧ f3),
	xlims=(-6,6), ylims=(0,10), fc=:blues, 
	label="A", legend=:topright, widen=false)     
# Region B
plot!((f5 ≦ f3) & (f5 ≧ f2) & (f5 ≧ f4),
	xlims=(-6,6), ylims=(0,10), fc=:green, 
	label="B", legend=:topright, widen=false)     
# Region C
plot!((f5 ≦ f2) & (f5 ≧ f3) & (f5 ≧ f4),
	xlims=(-6,6), ylims=(0,10), fc=:red, 
	label="C", legend=:topright, widen=false)     
# Region D
plot!((f5 ≦ f2) & (f5 ≦ f3) & (f5 ≧ f4),
	xlims=(-6,6), ylims=(0,10), fc=:orange, 
	label="D", legend=:topright, widen=false)     

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