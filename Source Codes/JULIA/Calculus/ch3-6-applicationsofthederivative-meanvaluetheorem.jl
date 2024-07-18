using Plots, LaTeXStrings, MTH229
gr()

f(x) = x^3 + 2

# secant in MTH229 package
sec_line(h) = secant(f, c, c+h) 
# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = -0.30
d = 0.8
               
plot(f, -2, 4, ylims=(-3,10),
    label=L"f(x) = x^{3}+2", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, d), -1.2,2.2 , label="tangent line for f(0.8)")
# Plot secant line through (-0.30,f(-0.30)) and (1.81, f(1.81))
# 1.51 -> x + c = -0.30 + 1.81
plot!(sec_line(1.81), label="secant line")

scatter!([0.8], [f(0.8)], color = "red1", label="", markersize = 3)
scatter!([-0.3], [f(-0.3)], color = "green1", label="", markersize = 3)
scatter!([1.51], [f(1.51)], color = "green1", label="", markersize = 3)

annotate!([(0.8,3, (L"A", 8, :black))])
annotate!([(-0.3,2.7, (L"C", 8, :black))])
annotate!([(1.3,5.7, (L"B", 8, :black))])