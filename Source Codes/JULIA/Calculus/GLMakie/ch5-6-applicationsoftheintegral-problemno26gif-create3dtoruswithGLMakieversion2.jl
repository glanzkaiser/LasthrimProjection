using GLMakie

Base.@kwdef mutable struct Torus
    R::Float64 = 2
    r::Float64 = 1
end

function generate_torus(torus::Torus, resolution=100; upto=1.0)
    u = range(0, stop=2π*upto, length=resolution) 
    v = range(0, stop=2π*upto, length=resolution) 
    x = [ ( torus.R + torus.r*cos(vᵢ) ) * cos(uᵢ) for vᵢ in v, uᵢ in u ]
    y = [ ( torus.R + torus.r*cos(vᵢ) ) * sin(uᵢ) for vᵢ in v, uᵢ in u ]
    z = [ torus.r * sin(vᵢ) for vᵢ in v, _ in u ]
    return x, y, z
end

function animate_torus(torus::Torus, filename="torus.gif")
    fig = Figure(resolution = (500, 500))
    ax = fig[1, 1] = LScene(fig)
    cam3d!(ax.scene)

    # Initialize surface plot with full torus
    x, y, z = generate_torus(torus)
    p = surface!(ax, x, y, z, colormap=:viridis, shading = false)
    # Set the limits
    xlims!(ax.scene, (-4, 4))
    ylims!(ax.scene, (-4, 4))
    zlims!(ax.scene, (-1, 1))

    record(fig, filename, range(0, stop=1, length=100)) do i
        # Update data of surface plot
        x, y, z = generate_torus(torus, upto=i)
        p[1] = x
        p[2] = y
        p[3] = z
    end
end

torus = Torus()
animate_torus(torus, "/home/browni/LasthrimProjection/JupyterLab/CairoMakie/glmakietorus.gif")
