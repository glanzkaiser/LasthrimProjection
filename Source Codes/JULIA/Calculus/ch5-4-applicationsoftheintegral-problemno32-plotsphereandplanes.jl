using Plots; plotlyjs()

function sphere(r, C)   # r: radius; C: center [cx,cy,cz]
    n = 100
    u = range(-π, π; length = n)
    v = range(0, π; length = n)
    x = C[1] .+ r*cos.(u) * sin.(v)'
    y = C[2] .+ r*sin.(u) * sin.(v)'
    z = C[3] .+ r*ones(n) * cos.(v)'
    return x, y, z
end

# the equation of a plane in 3-space: ax + by + cz = d
# at least one of the numbers a, b, c must be nonzero
# the plane as the graph of a function z of x and y: z = -(a/c)x + (-b/c) y + d/c

# Given points P, Q, R in space, find the equation of the plane through the 3 points.
# P = (1, 1, 1), Q = (1, 2, 0), R = (-1, 2, 1). 
# Solve with Gauss Elimination
# a + b + c = d
# a + 2b + 0c = d
# -a + 2b + c = d
function plane(x,y) 
    n = 100
    x=range(-3,stop=5,length = n)
    y=range(0,stop=5,length = n)
    f(x,y) = -y + 4.5
    my_cg2 = cgrad([:green,:orange])
    plot!(x,y,f,st=:surface,c=my_cg2,camera=(-30,30))
end

function plane2(x,y) 
    n = 100
    x=range(-3,stop=5,length = n)
    y=range(1,stop=5,length = n)
    f(x,y) = -y + 6
    my_cg2 = cgrad([:green,:orange])
    plot!(x,y,f,st=:surface,c=my_cg2,camera=(-30,30))
end

my_cg = cgrad([:red,:blue])
surface(sphere(2, [1,2,3]), c=my_cg)
surface(plane(0,1))
surface(plane2(0,1))

# using LinearAlgebraX
#A = [1 2 3 1;
#     0.5 2 3 1;
#     1.5 2 3 1]
# rrefx(A)
# Solution $a=0, b=1, c=1, d=5$

#Change result to Float
# Float64.(rrefx(A))