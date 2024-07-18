using ImplicitEquations, Plots, Roots, SymPy
gr()

f1(x,y) = x + 6
f2(x,y) = x^3
f3(x,y) = -x/2
f4(x,y) = y

plot((f4 ≦ f1) & (f4 ≧ f2) & (f4 ≧ f3), ylims=(-10,10), fc=:blues, 
	label="", widen=false)     
# \leqq[tab], \geqq[tab]
plot!(f1, -5, 5, c=:blue, ylims=(-10,10), label=L"y = x+6")
plot!(f2, -5, 5, c=:green, label=L"y = x^{3}")
plot!(f3, -5, 5, c=:red, label=L"2y + x = 0", legend=:topright)

#=
# To find the roots / intersection point 
h(x) = x + 6 - (-x/2)
find_zeros(h, -10,10)
k(x) = x + 6 - (x^3)
find_zeros(k, -10,10)

# To calculate the area 1
integrate(h,-4,0).evalf()
# To calculate the area 2
integrate(k,0,2).evalf()

=#

