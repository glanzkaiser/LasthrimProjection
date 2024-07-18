using Plots, LaTeXStrings; gr()

# To plot a spiral centered at (0, 0) 
θ = 0:0.005:π/4
x = sqrt(5)*sin.(2θ) .- 2
y = sqrt(5)*cos.(2θ) .- sqrt(3)
plot(x, y, xlims=(-5,1), ylims=(-4,1),
	label=L"(x,y) = (\sqrt{5} \ \sin \ 2t - 2 , \sqrt{5} \ \cos \ 2t - \sqrt{3})",
	framestyle=:zerolines, legend=:bottomleft)

