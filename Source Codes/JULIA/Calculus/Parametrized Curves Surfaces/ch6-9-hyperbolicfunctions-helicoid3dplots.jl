# https://mathinsight.org/parametrized_surface_introduction
using Plots;
#gr() 
plotlyjs()

function helicoid(r)   
    n = 100
    θ = range(-2pi, 2π; length = n)
    u = range(-10, 10; length = n)
    x = r*u*cos.(θ)'
    y = r*u*sin.(θ)'
    z = ones(size(u))*θ' # ones(size(u)) is a 100-element vector all entries are 1
    return x, y, z
end
my_cg = cgrad([:green,:blue,:red])
surface(helicoid(3),  label="helicoid")