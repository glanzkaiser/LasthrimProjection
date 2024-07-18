using Plots, LaTeXStrings, MTH229
gr()

f(x) = 2x^3 - 3x^2 -12x + 7
               
plot(f, -2, 3, ylims=(-15,30),
    label=L"f(x) = 2x^{3} - 3x^{2} - 12x + 7", framestyle=:zerolines,
     legend=:outertop)

plot!([-1.7,-0.4],[f(-1),f(-1)], label="", linecolor=:black)
plot!([1.4,2.5],[f(2),f(2)], label="", linecolor=:black)
plot!([-1,-1],[0,f(-1)], label="", linecolor=:black, linestyle=:dot)
plot!([2,2],[0,f(2)], label="", linecolor=:black, linestyle=:dot)
