using Plots, LaTeXStrings, MTH229
gr()

f(x) = x^4 + x^3 + x^2 + x
               
plot(f, -1, 1, ylims=(-1,3),
    label=L"f(x) = x^{4} + x^{3} + x^{2} + x", framestyle=:zerolines,
     legend=:outerright)
