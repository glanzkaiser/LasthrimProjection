using Plots, LaTeXStrings, MTH229
gr()

f(x) = cbrt(x) + 2

plot(f, -10, 10, ylims=(0,8),
    label=L"F(x) = x^{1/3} + 2", framestyle=:zerolines,
    legend=:outerright)

scatter!([0], [f(0)], color = "red1", label="Inflection point", markersize = 3)
