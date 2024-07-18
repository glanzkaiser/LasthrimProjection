using GLMakie
using ColorSchemes
set_theme!(backgroundcolor = :white)

# Torus equation to plot
# R - sqrt(x^2 + y^2) + z^2 = r^2
# r -> a (r is the radius of the smaller circle / innertube)
cmap3 = get(colorschemes[:plasma], LinRange(0,1,100))
	cmap4 = [(cmap3[i],0.65) for i in 1:100]
	ξ = -50:1:50
	c = 25
	a = 5
	torus = [((hypot(X,Y)-c)^2+Z^2-a^2) for X in ξ, Y in ξ, Z in ξ]
	volume(torus, algorithm = :iso,isovalue =100,isorange =50, colormap=cmap4)
	current_figure()