using Plots;
gr() 
#plotlyjs()

# a helix is a curve in 3-dimensional space. 
# The following parametrisation in Cartesian coordinates defines a particular helix;

function helix(r)   
    n = 100
    θ = range(-10, 10; length = n)
    x = r*cos.(θ)
    y = r*sin.(θ)
    z = θ
    return x, y, z
end
my_cg = cgrad([:red,:blue])
plot(helix(5), c=my_cg, label="helix", arrow=true, arrowsize=5)