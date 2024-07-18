# https://stackoverflow.com/questions/75418252/how-to-create-3d-torus-from-circle-revolved-about-x-2r-r-is-the-radius-of-circl/76400951#76400951

using Plots

Base.@kwdef mutable struct Torus
    x::Float64 = cos(0) + cos(0)*cos(0)
    y::Float64 = sin(0) + cos(0)*sin(0)
    z::Float64 = sin(0)
 end

function step!(torus::Torus, t, u; r=1)
    torus.x = r*cos(t) + cos(u)*cos(t)
    torus.y = r*sin(t) + cos(u)*sin(t)
    torus.z = sin(u)
    return torus
end

torus = Torus()
plt = plot([0], [0], [0], aspect_ratio=:equal, xlims=(-3, 3), ylims=(-3, 3), zlims=(-3, 3))
@gif for t in range(0, stop=2π, length=100)
     for u in range(0, stop=2π, length=100)
         step!(torus, t, u, r=2)
         push!(plt, torus.x, torus.y, torus.z)
     end
end every 2