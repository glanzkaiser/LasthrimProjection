using GLMakie
#using CairoMakie

f(x, y) = 1-exp(-(x^2+y^2))

r = 0:0.1:2
theta = LinRange(-pi, pi, 100)
x = r .* cos.(theta')
y = r .* sin.(theta')

R = 5.0

alpha = Observable(0.0)
x0 = @lift(R*cos($alpha))
y0 = @lift(R*sin($alpha))

fig = Figure()
ax = Axis3(fig[1,1], aspect=(3,3,1))
surface!(ax, @lift(x .- $x0), @lift(y .- $y0), f.(x, y), color=fill(:blue, size(x)), transparency=true)
surface!(ax, @lift(x .- $x0), @lift(y .+ $y0), f.(x, y), color=fill(:red, size(x)), transparency=true)
lines!(ax, R*cos.(theta), R*sin.(theta), zero(theta), color=:black, linestyle=:dash)
hidedecorations!(ax)
hidespines!(ax)

record(fig, "figure.mp4", -pi:0.05:pi; framerate=30) do α
    alpha[] = α
end