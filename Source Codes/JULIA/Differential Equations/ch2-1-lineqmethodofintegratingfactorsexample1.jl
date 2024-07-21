#It should be plotted using REPL to show all curves

using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x^2 + 1/x^2

p = plot(f, -2,2, xticks=false, xlims=(-2, 2), ylims=(-2, 4),
    bottom_margin=10mm, label=L"t^{2} + \frac{c}{t^{2}}", framestyle=:zerolines,
    legend=:outerright)

    for i = 1:0.5:3
        g(x) =  x^(2) + (i / x^(2))
        plot!(g, xticks=false, xlims=(-2, 2), ylims=(-2, 4),
            bottom_margin=10mm, label="", framestyle=:zerolines,
            legend=:outerright)
    end

    for i = 1:0.5:3
        g(x) =  x^(2) - (i / x^(2))
        plot!(g, xticks=false, xlims=(-2, 2), ylims=(-2, 4),
            bottom_margin=10mm, label="", framestyle=:zerolines,
            legend=:outerright)
    end
plot!()
