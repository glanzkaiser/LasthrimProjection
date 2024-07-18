using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

x = range(-4, 4, length=100)
y = @. 2^x
y2 = @. 3^x
y3 = @. 4^x

plot(x, y, label=L"2^{x}")
plot!(x, y2, label=L"3^{x}")
plot!(x, y3, label=L"4^{x}", legend=:bottomright)

plot!(yscale=:log10, minorgrid=true)
xlims!(-4, 4)
ylims!(1e-2, 1e+3)
title!("Semilog plot")
xlabel!("x")
ylabel!("y")