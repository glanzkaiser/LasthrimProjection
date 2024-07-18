# https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.7/differentiable_vector_calculus/vector_fields.html

using CalculusWithJulia
using Plots

gr()
F(r,theta) = r*[cos(theta), sin(theta)]
F(v) = F(v...)

rs = range(0, 2, length=5)
thetas = range(0, pi/2, length=9)

plot(legend=false, aspect_ratio=:equal)
plot!(unzip(F.(rs, thetas'))..., color=:red)
plot!(unzip(F.(rs', thetas))..., color=:blue)

pt = [1, pi/4]
J = ForwardDiff.jacobian(F, pt)
arrow!(F(pt...), J[:,1], linewidth=5, color=:red)
arrow!(F(pt...), J[:,2], linewidth=5, color=:blue)