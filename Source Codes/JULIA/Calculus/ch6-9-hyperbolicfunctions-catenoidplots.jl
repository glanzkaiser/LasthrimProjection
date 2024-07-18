using Plots; 
plotlyjs()

function catenoid(c)   
    n = 100
    u = range(-π, π; length = n)
    v = range(-2, 2; length = n)
    x = c*cosh.(v/c) * cos.(u)'
    y = c*sinh.(v/c) * sin.(u)'
     z = v* ones(size(u))'
    return x, y, z
end

my_cg = cgrad([:red,:blue])
surface(catenoid(2), c=my_cg)