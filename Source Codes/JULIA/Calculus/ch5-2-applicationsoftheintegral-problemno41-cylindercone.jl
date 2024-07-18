using Plots; plotlyjs()

function cyl_cone(; h =2, m=50, n=50, fillalpha=0.6)
    #cone parameterizarion u∈[0, 2π], v∈[0, h]; 
    X(u,v) = v*cos(u)
    Y(u,v) = v*sin(u)
    Z(u,v) = v
    #cylinder circumscribed to the above cone; u∈[0, 2π], v∈[0, h]
    x(u, v) = h*cos(u)
    y(u, v) = h*sin(u)
    z(u, v) = v
    u=range(0, 2pi, length=m)
    v = range(0, h, length=n)
    plt =surface(x.(u, v'), y.(u, v'), ones(m) *v', fillalpha=0.7)
    surface!(plt, (X.(u, v'), Y.(u, v'), Z.(u, v')))
    wireframe!(plt, (X.(u, v'), Y.(u, v'), Z.(u, v')))
    return plt
end    
plt =cyl_cone(;)