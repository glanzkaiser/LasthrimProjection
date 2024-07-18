using Plots;
gr() 

function invertedcone(r)   
    n = 100
    θ = range(0, 2π; length = n)
    u = range(0, 1; length = n)
    x = r*u*cos.(θ)'
    y = r*u*sin.(θ)'
    z = θ*ones(size(u))'
    return x, y, z
end
my_cg = cgrad([:red,:blue])
surface(invertedcone(3), c=my_cg, label="inverted cone", arrow=true, arrowsize=5)