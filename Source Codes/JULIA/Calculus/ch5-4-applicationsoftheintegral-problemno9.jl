using Plots, LaTeXStrings; gr()

# To plot a spiral centered at (0, 0) 
θ = 0:0.005:1π
x = 4*sin.(θ)
y = 4*cos.(θ) .- 5
plot(x, y, xlims=(-5,5), ylims=(-10,0),
	label=L"(x,y) = (4 \ \sin \ t , 4 \ \cos \ t - 5)",
	framestyle=:zerolines)

