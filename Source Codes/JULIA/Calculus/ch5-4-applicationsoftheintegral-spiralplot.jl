using Plots, LaTeXStrings; gr()

# To plot a spiral centered at (0, 0) 
θ = 0:0.1:10.1π
x = θ.*cos.(θ)
y = θ.*sin.(θ)
plot(x, y, xlims=(-50,50), ylims=(-50,50),
	label=L"(x,y) = (t \ \cos \ t , t \ \sin \ t)",
	framestyle=:zerolines, aspect_ratio=:equal)

