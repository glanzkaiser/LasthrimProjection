using GLMakie
GLMakie.activate!()
set_theme!(backgroundcolor = :white)

Θ = ϕ = range(-π,π,300)
x = [(2 + cos(v)) * cos(u) for u in Θ, v in ϕ]
y = [(2 + cos(v)) * sin(u) for u in Θ, v in ϕ]
z = [1.5*sin(v) for u in Θ, v in ϕ]
fig = surface(x, y, z, colormap = [:dodgerblue],
    lightposition = Vec3f(0, 0, 0.8), ambient = Vec3f(0.6, 0.6, 0.6),
    backlight = 2.0f0)
#wireframe!(x, y, z; overdraw = false, linewidth = 0.1) # try overdraw = true
fig

