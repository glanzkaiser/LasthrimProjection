using Plots, LaTeXStrings, MTH229
gr()

f(x) = (24x/(π))^(1/3)

plot(f, 0, 20, ylims=(0,8),
    label=L"h(t) = (\frac{24t}{π})^{1/3}", framestyle=:zerolines,
    legend=:outerright)
