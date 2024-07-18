using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

x = range(0, 10, length=100)
y = @. 14/x
y2 = @. 0.29x^(2.38)
y3 = @. 2x^(0.47)

plot(x, y, label="")
plot!(x, y2, label="")
plot!(x, y3, label="")

plot!(xscale=:log10, yscale=:log10, minorgrid=true)
xlims!(1e-0,1e+1)
ylims!(1e-0, 1e+2)
title!("log-log plot")
xlabel!("x")
ylabel!("y")