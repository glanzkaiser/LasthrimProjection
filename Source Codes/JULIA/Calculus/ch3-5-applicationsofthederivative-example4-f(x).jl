using Plots, LaTeXStrings, MTH229

gr()

f(x) = cbrt(x)
g(x) = f'(x)

p1 = plot(f, -4, 4, xlims=(-4,4), ylims=(-2,3),
    label=L"f(x) = x^{1/3}", framestyle=:zerolines,
    top_margin = 15mm, legend=:outerright)

p2 = plot(g, -4, 4, xlims=(-4,4), ylims=(-2,6),
    label=L"f'(x) = \frac{1}{3} x^{-2/3}", framestyle=:zerolines,
    top_margin = 15mm, legend=:outerright)

plot(p1, p2, layout = (2, 1), legend=:outerright,
     xaxis = "x", yaxis = "y(x)")