using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

x = range(0, 10, length=100)
y = @. ((2^(1.5))*(2^(2.5)))^x

plot(x, y, label=L"y = Cb^{x}")

plot!(yscale=:log10, minorgrid=true)
xlims!(0, 1)
ylims!(1e-0, 15)
title!("Semilog plot")
xlabel!("x")
ylabel!("y")