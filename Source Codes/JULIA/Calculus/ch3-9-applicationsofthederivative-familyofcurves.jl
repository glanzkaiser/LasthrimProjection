using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x^2 

p = plot(f, -3,5, xticks=false, xlims=(-3, 5), ylims=(-2, 5),
    bottom_margin=10mm, label=L"y = x^{2} + c", framestyle=:zerolines,
    legend=:outerright)

    for i = 1:1:3
        g(x) =  x^(2) + i
        plot!(g, xticks=false, xlims=(-3, 3), ylims=(-2, 5),
            bottom_margin=10mm, label="", framestyle=:zerolines,
            legend=:outerright)
    end

    for i = 1:1:1
        g(x) =  x^(2) - i
        plot!(g, xticks=false, xlims=(-3, 3), ylims=(-2, 5),
            bottom_margin=10mm, label="", framestyle=:zerolines,
            legend=:outerright)
    end
plot!()