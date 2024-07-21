using CairoMakie, Meshes

function sierpinski()
    # create observable holding scatter points
    tr = Observable(CairoMakie.Point2f[(0, 0), (1, 0), 0.5.*(1, sqrt(3))])

    # create a scatter plot of that observable
    f, ax, sc = scatter(tr, markersize = 3)

    # create the starting point for the iterative algorithm
    m = CairoMakie.Point2f(0.5 .* ((0,0).+ (1,0)))
    
    # make a recording of figure `f` with 300 frames
    record(f, "sierpinski.mp4", 1:300) do frame
        # add 10 new points per frame
        for i in 1:10
            # calculate a new m
            m = 0.5f0 * (m + tr[][rand(1:3)])
            # and push it to the vector contained in the observable tr
            # without updating the observable, yet
            push!(tr[], m)
        end
        # after all new points are added, update the observable tr once
        # so the scatter plot is updated as well for the new frame
        # that is being created each time that this closure returns
        notify(tr)
    end
end

sierpinski()
