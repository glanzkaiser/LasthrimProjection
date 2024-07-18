using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia # ignore any warnings 
gr()

x = range(0, 10, length=100)
y = @. log(2,x)
y2 = @. log(3,x)
y3 = @. log(4,x)

plot(x, y, label=L"log_{2} x")
plot!(x, y2, label=L"log_{3} x")
plot!(x, y3, label=L"log_{4} x", legend=:bottomright)

plot!(yscale=:log10, minorgrid=true)
xlims!(0, 10)
ylims!(1e-2, 1e+2)
title!("Semilog for the inverse functions plot")
xlabel!("x")
ylabel!("y")