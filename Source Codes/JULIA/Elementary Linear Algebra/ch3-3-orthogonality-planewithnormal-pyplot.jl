using Plots; 
pyplot(dpi=100)

function arrow3d!(P, V; lc=:black, lw=2, camera=(10,30))
    n = 7                           # break arrowhead in n-parts
    ni = (0:n-1)/n 
    lwi = range(0.1, 4*lw, n)       # arrowhead variable thickness                   
    d = V .* 1/10                   # controls relative arrow length
    P1 =  P + V
    P0 =  P1 - d
    plot!([P[1], P1[1]], [P[2], P1[2]], [P[3], P1[3]], lw=lw, lc=lc, label=false, camera=camera)
    for (i,li) in zip(ni,lwi)
        di = d .* i
        plot!([P0[1], P1[1]-di[1]], [P0[2], P1[2]-di[2]], [P0[3], P1[3]-di[3]], lw=li, lc=lc, label=false)
    end
    return Plots.current()
end

using LinearAlgebra
p1, p2, p3 = [2,0,0], [0,2,0], [0,0,2]
c = .+(p1, p2, p3) ./ 3
n = cross(p1-p2, p1-p3) ./ (norm(p1-p2)*norm(p1-p3))
surface(p1, p2, p3, c=:blues, alpha=0.3, aspect_ratio=:equal, cbar=false)
scatter!([c[1]], [c[2]], [c[3]], ms=7, label=false)
arrow3d!(c, n; lc=:blue, camera=(70,30))
arrow3d!(c, (p3-c)*1/3; lc=:blue, camera=(70,30))