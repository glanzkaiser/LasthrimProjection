using Plots, LaTeXStrings, MTH229
gr()

f(x) = x^(6) + 5
g(x) = x^(6) - 5
h(x) = f'(x)

plot(f, -4, 4, ylims=(-10,10),
    label=L"f(x) = x^{6} + 5", framestyle=:zerolines,
    legend=:outerright)

plot!(g, -4, 4, ylims=(-10,10),
    label=L"g(x) = x^{6} - 5", framestyle=:zerolines,
    legend=:outerright)

plot!(h, -4, 4, ylims=(-10,10),
    label=L"f'(x)=g'(x) = 5x^{5}", framestyle=:zerolines,
    legend=:outerright)