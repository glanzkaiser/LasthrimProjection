using Plots, LaTeXStrings, Plots.PlotMeasures, PrettyTables
gr()

f(x) = x^2-3

println(pretty_table(String, 
 	 vcat([[j f(j)] for j in -3:1:3]...); 
  	header=["x", "f(x)"]))

plot(f,-3,3, label=L"f(x) = x^{2} - 3",
	framestyle=:zerolines, legend=:bottomright, bottom_margin=3mm)

for N in -3:1:3
    g = (N^2 - 3)
    display(scatter!([N],[N^2-3],color = "red1", label="", markersize = 3))
end
