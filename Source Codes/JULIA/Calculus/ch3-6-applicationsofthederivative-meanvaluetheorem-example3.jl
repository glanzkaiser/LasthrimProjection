using Plots, LaTeXStrings, MTH229
gr()

f(x) = cbrt(x^2)

# secant in MTH229 package
sec_line(h) = secant(f, c, c+h) 
# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = -8
d1 = 102
               
plot(f, -20, 30, ylims=(-3,10),
    label=L"f(x) = x^{2/3}", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, d1), -20,27 , label="tangent line for f(102)")

# Plot secant line through (-8,f(-8)) and (27, f(27))
# 27 -> x + c = -8 + 35
plot!(sec_line(35), label="secant line")

scatter!([-8], [f(-8)], color = "red1", label="", markersize = 3)
scatter!([27], [f(27)], color = "red1", label="", markersize = 3)

annotate!([(-10,4.07, (L"A", 8, :black))])
annotate!([(25,9.5, (L"B", 8, :black))])