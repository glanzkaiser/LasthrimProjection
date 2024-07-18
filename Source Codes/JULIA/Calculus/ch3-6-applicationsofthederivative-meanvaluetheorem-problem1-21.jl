using Plots, LaTeXStrings, MTH229
gr()

f(x) = x + abs(x)
               
plot(f, -2, 1, ylims=(0,2),
    label=L"f(x) = x + |x|", framestyle=:zerolines,
     legend=:outerright)
