using Plots, LaTeXStrings, MTH229
gr()

f(x) = 1 + 1/x

# secant in MTH229 package
sec_line(h) = secant(f, s, s+h) 
# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

s = 1
c = sqrt(2)
               
plot(f, 1, 2, xlims =(0,2.5), ylims=(0,3),
    label=L"f(x) = 1 + \frac{1}{x}", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, c), 1,2 , label="tangent line for f(c)")

# Plot secant line through (-1,f(-1)) and (1, f(1))
# 2 -> x + c = 1 + 1
plot!(sec_line(1), label="secant line")

scatter!([1], [f(1)], color = "red1", label="", markersize = 3)
scatter!([2], [f(2)], color = "red1", label="", markersize = 3)
scatter!([sqrt(2)], [f(sqrt(2))], color = "green1", label="", markersize = 3)

annotate!([(1,2.07, (L"A", 8, :black))])
annotate!([(2,1.6, (L"B", 8, :black))])
annotate!([(sqrt(2),1.6, (L"\sqrt{2}", 8, :black))])
