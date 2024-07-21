th1 = 120.0
w1 = 0.0
th2 = -10.0
w2 = 0.0

p = (; M1, M2, L1, L2, G)
prob = ODEProblem(pendulum!, deg2rad.([th1, w1, th2, w2]), (0.0, t_stop), p)
sol = solve(prob, Tsit5())



x1 = +L1 * sin.(sol[1, :])
y1 = -L1 * cos.(sol[1, :])

x2 = +L2 * sin.(sol[3, :]) + x1
y2 = -L2 * cos.(sol[3, :]) + y1



using Plots
anim = @animate for i in eachindex(x2)

    x = [0, x1[i], x2[i]]
    y = [0, y1[i], y2[i]]

    plot(x, y, legend = false)
    plot!(xlims = (-2, 2), xticks = -2:0.5:2)
    plot!(ylims = (-2, 1), yticks = -2:0.5:1)
    scatter!(x, y)

    x = x2[1:i]
    y = y2[1:i]

    plot!(x, y, linecolor = :orange)
    plot!(xlims = (-2, 2), xticks = -2:0.5:2)
    plot!(ylims = (-2, 1), yticks = -2:0.5:1)
    scatter!(
        x,
        y,
        color = :orange,
        markersize = 2,
        markerstrokewidth = 0,
        markerstrokecolor = :orange,
    )
    annotate!(-1.25, 0.5, "time= $(rpad(round(sol.t[i]; digits=2),4,"0")) s")
end
gif(anim, fps = 10)
