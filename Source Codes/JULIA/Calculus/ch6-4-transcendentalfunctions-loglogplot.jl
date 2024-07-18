using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

x = 10 .^ range(0, 4, length=100)
y = @. 1/(1+x)

plot(x, y, label="1/(1+x)")
plot!(xscale=:log10, yscale=:log10, minorgrid=true)
xlims!(1e+0, 1e+4)
ylims!(1e-5, 1e+0)
title!("Log-log plot")
xlabel!("x")
ylabel!("y")