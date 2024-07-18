# https://discourse.julialang.org/t/creating-a-mesh-with-meshes-need-to-use-smoothing-taubin-and-getting-afterwards-a-mesh-compatible-with-makie/81029

# create a simple mesh giving a set of points
using GLMakie
Θ = LinRange(0, 2π, 100) # 50
Φ = LinRange(0, π, 100)
r = 0.5
x = [r * cos(θ) * sin(ϕ) + 0.1 * rand() for θ in Θ, ϕ in Φ]
y = [r * sin(θ) * sin(ϕ) + 0.1 * rand() for θ in Θ, ϕ in Φ]
z = [r * cos(ϕ) + 0.1 * rand() for θ in Θ, ϕ in Φ]
surface(x,y,z)

using GeometryBasics
using Makie: get_dim, surface_normals

function gen_uv(shift, z)
    return vec(map(CartesianIndices(size(z))) do ci
        tup = ((ci[1], ci[2]) .- 1) ./ ((size(z) .* shift) .- 1)
        return Vec2f(reverse(tup))
    end)
end

uv = gen_uv(1.0, z)
uv_buff = Buffer(uv)

function getMesh(x, y, z, uv_buff)
    positions = vec(map(CartesianIndices(z)) do i
        GeometryBasics.Point{3,Float32}(
            get_dim(x, i, 1, size(z)),
            get_dim(y, i, 2, size(z)),
            z[i])
    end)
    faces = decompose(GLTriangleFace, Rect2D(0.0f0, 0.0f0, 1.0f0, 1.0f0), size(z))
    normals = surface_normals(x, y, z)
    vertices = GeometryBasics.meta(positions; uv=uv_buff, normals=normals)
    meshObj = GeometryBasics.Mesh(vertices, faces)
    meshObj
end
meshSphere = getMesh(x, y, z, uv_buff);
mesh(meshSphere; color=rand(10, 100))


