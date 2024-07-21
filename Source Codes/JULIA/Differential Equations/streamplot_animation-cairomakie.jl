using CairoMakie

time = Observable(0.0)

sf = @lift p -> Point2(p[2] * $time, 4 * p[1])
title = @lift string("t = ", round($time; sigdigits=2))

fig = Makie.streamplot(
        sf,
        -2..2, -2..2;
        linewidth=2,
        colormap=:magma,
        axis=(; title),
       )

@time record(fig, "streamplotanimation.mp4", range(0, 20, 6*30)) do t
    time[] = t
end