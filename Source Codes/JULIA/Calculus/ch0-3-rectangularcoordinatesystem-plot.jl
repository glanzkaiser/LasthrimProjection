using Plots, LaTeXStrings, Plots.PlotMeasures, PrettyTables
gr()

scatter([3.5],[2.7],framestyle=:zerolines, color = "red1", label=L"(a,b)", markersize = 3)
plot!([3.5,3.5],[0,2.7], label="", linecolor=:green, linestyle=:dash)
plot!([0,3.5],[2.7,2.7], label="", linecolor=:green, linestyle=:dash)