using Plots, LaTeXStrings, MTH229
gr()

f(x) = x^3 - x^2 - x + 1

# secant in MTH229 package
sec_line(h) = secant(f, c, c+h) 
# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = -1
d1 = -0.55
d2 = 1.22
               
plot(f, -2, 4, ylims=(-3,10),
    label=L"f(x) = x^{3}+x^{2} - x + 1", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, d1), -1.2,0.2 , label="tangent line for f(-0.55)")
plot!(tangent(f, d2), 0.2,2.2 , label="tangent line for f(1.22)")

# Plot secant line through (-1,f(-1)) and (2, f(2))
# 2 -> x + c = -1 + 3
plot!(sec_line(3), label="secant line")

scatter!([1.22], [f(1.22)], color = "red1", label="", markersize = 3)
scatter!([-0.55], [f(-0.55)], color = "red1", label="", markersize = 3)
scatter!([-1], [f(-1)], color = "purple1", label="", markersize = 3)
scatter!([2], [f(2)], color = "purple1", label="", markersize = 3)

annotate!([(-1,-0.37, (L"A", 8, :black))])
annotate!([(2.13,2.7, (L"B", 8, :black))])