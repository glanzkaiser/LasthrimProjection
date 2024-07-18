using GLMakie, ColorSchemes
cbarPal= :plasma
cmap = get(colorschemes[cbarPal], LinRange(0,1,100))
cmap2 = [(cmap[i],0.65) for i in 1:100]

X = 0:5:50 # X = -40:5:40
ellipse1 = [X^2/2 + Y^2 + 2Z^2 for X in X, Y in X, Z in X];
ellipse2 = [X^2/2 + (Y-20)^2 + 2Z^2 for X in X, Y in X, Z in X];
volume(ellipse2, algorithm = :iso,isovalue =350,isorange = 50, colormap=cmap2)
#volume!(ellipse1, algorithm = :iso, isovalue =700,isorange = 50, colormap=cmap2)
current_figure()