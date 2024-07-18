using GLMakie
set_theme!(backgroundcolor = :white)

r = LinRange(-1, 1, 100)
cube = [(x.^2 + y.^2 + z.^2) for x = r, y = r, z = r]
#cube_with_holes = cube .* (cube .> 1.4)
# volume(algorithm=:iso) can be used to make it with holes
volume(cube, isorange = 0.05, isovalue = 1.7,transparency=true, 
	colormap = [:green]) 
#contour(cube_with_holes,levels=[1.65,1.7],colormap=:blues,alpha=.3,colorrange=[-8,8])

