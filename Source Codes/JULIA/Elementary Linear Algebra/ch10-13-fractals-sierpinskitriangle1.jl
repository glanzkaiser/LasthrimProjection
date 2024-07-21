# Took 6 hours with my Dell Precision laptop 16 GB RAM
# For 4 MB GIF with 1000 png (the gif can be obtained from the same directory as the .jl file
# The png can be seen at /tmp

using Plots; gr()

tr = [(0,0),(1,0),0.5.*(1,sqrt(3))]
p = plot(tr, st=:scatter, markersize=3, legend=false)
m = 0.5 .* ((0,0).+ (1,0))
sierpinski = [m]
anim = @animate for i in 1:1000
    global m = 0.5 .* (m .+ tr[rand(1:3)])
    push!(sierpinski,m)
    plot!(p,sierpinski, st=:scatter, markersize=1, legend=false)
end

gif(anim, "sierpinski.gif", fps=10)
