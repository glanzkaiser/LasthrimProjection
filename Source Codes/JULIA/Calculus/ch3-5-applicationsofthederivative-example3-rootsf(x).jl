using Plots, LaTeXStrings, MTH229

gr()

f(x) = (sqrt(x)*(x-5)^(2))/(4)

plot(f, 0, 20, xlims=(0,15), ylims=(-1,20),
    label=L"f(x) = \frac{\sqrt{x}(x-5)^{2}}{4}", framestyle=:zerolines,
    top_margin = 15mm, legend=:outerright)

scatter!([2.6], [f(2.6)], color = "green1", label="inflection point", markersize = 3)
scatter!([5], [f(5)], color = "red1", label="Local min (5,0)", markersize = 3)
scatter!([1], [f(1)], color = "green", label="Local max (1,4)", markersize = 3)
