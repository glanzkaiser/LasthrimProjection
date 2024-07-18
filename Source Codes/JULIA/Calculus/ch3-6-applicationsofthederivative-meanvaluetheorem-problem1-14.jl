using Plots, LaTeXStrings, MTH229
gr()

f(x) = cbrt(x^5)

# secant in MTH229 package
sec_line(h) = secant(f, s, s+h) 
# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

s = -1
c = (3/5)^(3/2)
               
plot(f, -2, 2, ylims=(-3,2),
    label=L"f(x) = x^{5/3}", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, c), -2,2 , label="tangent line for f(c)")

# Plot secant line through (-1,f(-1)) and (1, f(1))
# 1 -> x + c = -1 + 2
plot!(sec_line(2), label="secant line")

scatter!([-1], [f(-1)], color = "red1", label="", markersize = 3)
scatter!([1], [f(1)], color = "red1", label="", markersize = 3)

annotate!([(-1,-0.87, (L"A", 8, :black))])
annotate!([(1,1.2, (L"B", 8, :black))])