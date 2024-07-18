using Plots; plotlyjs()

function sphere(r, C)   # r: radius; C: center [cx,cy,cz]
    n = 100
    u = range(-π, 0; length = n) # To create a sphere make it -π,π 
    v = range(0, π; length = n)
    x = C[1] .+ r*cos.(u) * sin.(v)'
    y = C[2] .+ r*sin.(u) * sin.(v)'
    z = C[3] .+ r*ones(n) * cos.(v)'
    return x, y, z
end

surface(sphere(2, [1,2,3]), fillalpha=0.6)
wireframe!(sphere(2, [1,2,3]))