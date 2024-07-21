#It should be plotted using REPL to show all curves

using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = (1 + 3x*sin(2x)/2 + 3*cos(2x)/4)/x

fg = plot(f, -5,5, xticks=false, xlims=(-5, 5), ylims=(-4, 4),
    bottom_margin=10mm, label=L"y(t) = \frac{c + 3t \frac{\sin (2t)}{2} + 3 \frac{\cos (2t)}{4}}{t}", framestyle=:zerolines,
    legend=:outerright)

    for i = 1:0.5:3
        g(x) =  (i + 3x*sin(2x)/2 + 3*cos(2x)/4)/x
        plot!(g, xticks=false, xlims=(-2, 2), ylims=(-4, 4),
            bottom_margin=10mm, label="", framestyle=:zerolines,
            legend=:outerright)
    end

    for i = 1:0.5:3
        g(x) =  (-i + 3x*sin(2x)/2 + 3*cos(2x)/4)/x
        plot!(g, xticks=false, xlims=(-2, 2), ylims=(-4, 4),
            bottom_margin=10mm, label="", framestyle=:zerolines,
            legend=:outerright)
    end
plot!()
