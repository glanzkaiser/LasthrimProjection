using Plots, LaTeXStrings; gr()

# To plot a spiral centered at (0, 0) 
θ = 0:0.005:2π
x = 8*(sin.(θ)).^3 
y = 8*(cos.(θ)).^3 
plot(x, y, xlims=(-8,8), ylims=(-8,8),
	label=L"(x,y) = a \ \sin^{3} \ t, a \ \cos^{3} \ t)",
	framestyle=:zerolines, legend=:bottomleft)

