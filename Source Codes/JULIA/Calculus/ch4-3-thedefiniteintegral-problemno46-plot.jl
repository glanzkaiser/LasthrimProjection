using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

# To calculate the integral
#x = symbols("x")
#f1(x) = (1 + 1/x)^5
#f2(x) = integrate(f1)
               
f(x) = (1 + 1/x)^5
g(x) =  x + 5log(x) + (-120x^3 - 60x^2 - 20x - 3)/(12x^(4))

plot(f, 10, 20, xlims=(0,30), ylims=(0,30),
    label=L"f(x) = (1 + \frac{1}{x} )^{5}", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outertop)
plot!(g, 10, 20, xlims=(0,30), ylims=(0,30),
    label=L"\int f(x) \ dx = x + 5 \log(x) + \frac{-120x^{3} - 60x^{2} - 20x - 3}{12x^{4}}", 
    bottom_margin=3mm, left_margin=3mm, framestyle=:zerolines,
    legend=:outertop)
