# Will try this
# Took  hours with my Dell Precision laptop 16 GB RAM
# The png can be seen at /tmp

using Plots; gr(dpi=100)

function sierpinski_gif(n)
    p = scatter(1, xlim=(0,1), ylim=(0,√3/2), legend=false, ms=1.5, msw=0, marker=:utriangle, c=:black)
    m = 0.5 .* ((0,0) .+ (1,0))
    anim = @animate for i=1:n
        m = 0.5 .* (m .+ rand([(0,0), (1,0), 0.5 .* (1, √3)]))
        push!(p, m)
    end every 10
    gif(anim, "sierpinski.gif")
    return p
end

sierpinski_gif(5000)        # 21 s (40 M allocs: 889 MiB, 0.4% gc time)
