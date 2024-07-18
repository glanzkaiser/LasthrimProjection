# https://discourse.julialang.org/t/need-help-to-create-animation-for-tangent-line-with-luxor/87809/5

using Luxor
using Zygote

## mathspace to drawingspace
K = 400/2 / 2π
Pt(x, y) = Point(K * x, -K * y)

f(x) = sin(2x) * cos(x/2)

gradient_line(f, x₀) = (x -> f(x₀) + f'(x₀) * (x - x₀))

function drawcurve(w, h)
    @layer begin
        setopacity(0.25)
        rule(O)
        rule(O, π/2)
    end
    move(Pt(-2π, 0))
    for x in -2π:π/24:2π
        line(Pt(x, f(x)))
    end
    strokepath()
end

function frame(scene, framenumber)
    w, h = scene.movie.width, scene.movie.height
    background("black")
    sethue("gold")
    drawcurve(w, h)
    x = rescale(framenumber, 1, scene.framerange.stop, -2π, 2π)
    pt = Pt(x, f(x))
    circle(pt, 5, :fill)
    δ = 0.1
    y = gradient_line(f, x)(x)
    point_on_curve = Pt(x, y)

    y1 = gradient_line(f, x)(x - δ)
    y2 = gradient_line(f, x)(x + δ)

    sl = slope(Pt(x - δ, y1), Pt(x + δ, y2))
    sethue("white")
    line(point_on_curve - polar(100, sl), 
         point_on_curve + polar(100, sl), :stroke)
end

demo = Movie(400, 300, "slope")
animate(demo, [Scene(demo, frame, 1:100)], framerate=10, creategif=true)
