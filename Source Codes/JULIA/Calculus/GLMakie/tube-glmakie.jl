using GLMakie, LinearAlgebra
set_theme!(backgroundcolor = :black)

L(s)  = [R*cos(s), R*sin(s), H*s]
∇L(s) = [-R*sin(s), R*cos(s), H]

function C(s,u)
    n1, n2 = eachcol(nullspace(adjoint(∇L(s))))
    return L(s) + r*cos(u) * n1 + r*sin(u) * n2
end

r = 0.5; R = 5.0; H = 1.0   # define constants
s = LinRange(0, 8π, 1000);  u = LinRange(0, 2π, 36)
xs, ys, zs = ([p[i] for p in C.(s, u')] for i in 1:3)

scene = surface(xs, ys, zs; lightposition = GLMakie.Vec3f0(0,0,-100))