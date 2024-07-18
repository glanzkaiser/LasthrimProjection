using Plots, LaTeXStrings, Plots.PlotMeasures, PrettyTables
gr()

f(x) = x

plot(f,xlims=(-4,4), ylims=(-4,4), label="",
		framestyle=:zerolines)
scatter!([3],[3], color = "red1", label=L"(x,y)", markersize = 3)
scatter!([0],[0], color = "green", label=L"(0,0)", markersize = 3)

for N in -3:1:-1
     display(plot!(N*f(x), label=""))
end

for N in 2:1:3
     display(plot!(N*f(x), label=""))
end

