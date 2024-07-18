using Plots, LaTeXStrings; gr()

# To plot a spiral centered at (0, 0) 
θ = 0:0.1:1.2π
x = 2*cos.(θ)
y = 4*sin.(θ)
plot(x, y, xlims=(-2.3,2.3), ylims=(0,5),
	label=L"(x,y) = (2 \ \cos \ t , 4 \ \sin \ t)",
	framestyle=:zerolines)

