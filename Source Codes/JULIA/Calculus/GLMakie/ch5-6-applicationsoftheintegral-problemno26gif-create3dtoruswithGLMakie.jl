# https://stackoverflow.com/questions/75418252/how-to-create-3d-torus-from-circle-revolved-about-x-2r-r-is-the-radius-of-circl/76400951#76400951

using GLMakie

Base.@kwdef mutable struct Torus
    R::Float64 = 2
    r::Float64 = 1
end

function generate_torus(torus::Torus,upto,resolution=100)
    u = range(0, stop=2π*upto, length=resolution) 
    v = range(0, stop=2π*upto, length=resolution) 
    x = [ ( torus.R + torus.r*cos(vᵢ) ) * cos(uᵢ) for vᵢ in v, uᵢ in u ]
    y = [ ( torus.R + torus.r*cos(vᵢ) ) * sin(uᵢ) for vᵢ in v, uᵢ in u ]
    z = [ torus.r * sin(vᵢ) for vᵢ in v, _ in u ]
    return (x, y, z)
end

function setup_scene(fig,torus::Torus,upto)
    ax = Axis3(fig[1, 1], aspect = :data, perspectiveness = 0.5, elevation = π / 9,
        xzpanelcolor = (:black, 0.75), yzpanelcolor = (:black, 0.75),
        zgridcolor = :grey, ygridcolor = :grey, xgridcolor = :grey)
    xlims!(ax, -4, 4)
    ylims!(ax, -4, 4)
    zlims!(ax, -1, 1)
    lift(d->surface!( generate_torus(torus,d)...;  colormap=:plasma, shading = false,transparency = false),upto)
    # lift(d->wireframe!(ax, generate_torus(torus,d)...; linewidth = 0.5, transparency = true),upto)
    display(fig)
    fig
end
    
function main_movie()
    GLMakie.activate!()
    fig = Figure(resolution = (800, 800), fontsize = 22)
    upto = Observable(0.)
    fig=setup_scene(fig,Torus(),upto)
    # record(fig, "torus.mp4", range(0, stop=1, length=100)) do i
    record(fig, "torus.gif", range(0, stop=1, length=100)) do i
            upto[] = i # Update data of surface plot
    end
end

function main_live()
    GLMakie.activate!()
    fig = Figure(resolution = (800, 800), fontsize = 22)
    upto = Observable(0.)
    fig=setup_scene(fig,Torus(),upto)
    for i ∈  range(0, stop=1, length=100)
        sleep(0.01)
        upto[] = i # Update data of surface plot
    end
end

function main_slider()
    GLMakie.activate!(float=true)
    fig = Figure(resolution = (2000, 2000), fontsize = 22)
    sl = Slider(fig[2,1],range=0:0.01:1,startvalue=0.01)
    fig = setup_scene(fig,Torus(),sl.value)
    fig
end


main_live()