using MTH229, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = 93cos(2π*x) - 60cos(2π*(1.51x-1))^(2) + 93sin(2π*x) - 120sin(2π*(1.51x-1))^(2)

g(x) = f'(x)
# the result is the same if we write the code below or just f'(x)
#g(x) = -34359cos(2π*x)*sin(9.48761x) + (cos(9.48761x)*204932sin(9.48761*x) - 141643sin(2π*x))

p1 = plot(f, -20, 20, xlims=(-20,20), xticks = true, yticks = true,
    label=L"D(t)", framestyle=:zerolines, bottom_margin = 10mm,
     legend=:outerright)

p2 = plot(f, -20, 20, xlims=(-20,20), xticks = true, yticks = true,
    label=L"D'(t)", framestyle=:zerolines, bottom_margin = 10mm,
     legend=:outerright)

plot(p1, p2, layout = (2, 1), legend=:outerright,
     xaxis = "x", yaxis = "y(x)")