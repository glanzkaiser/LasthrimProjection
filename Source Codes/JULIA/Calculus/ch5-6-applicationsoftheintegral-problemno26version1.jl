"""
Rotation of a figure in the XY plane about the Y axis:
    ϕ = angle of rotation
    z' = z * cos(ϕ) - x * sin(ϕ)
    x' = z * sin(ϕ) + x * cos(ϕ)
    y' = y
"""

using Plots

# OP definition of the circle, but we put center at x, y of 4, 0
#    for the torus, otherwise we get a bit of a sphere

θ = 0:0.1:2.1π 
x = 4 .+ 2cos.(θ)  # center at (s, 0, 0)
y = 0 .+ 2sin.(θ)
# add the original z values as 0
z = zeros(length(x))
plot(x, y, z, color=:red)

# add the rotation axis
ϕ = 0:0.1:π/2 # for full torus use 2π at stop of range
xprime, yprime, zprime = Float64[], Float64[], Float64[]

for a in ϕ, i in eachindex(θ)
    push!(zprime, z[i] + z[i] * cos(a) - x[i] * sin(a))
    push!(xprime, z[i] * sin(a) + x[i] * cos(a))
    push!(yprime, y[i])
end

plot!(xprime, yprime, zprime, alpha=0.3, color=:green)