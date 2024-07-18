using Plots, LaTeXStrings, MTH229
gr()

# secant in MTH229 package
sec_line(h) = secant(f, c, c+h) 

f(x) = exp(-x)*sin(x)
c = 0.21
               
plot(f, 0.1, 1.5, xlims=(0,1),
    label=L"f(x) = e^{-x} \sin(x)", legend=:outerright, framestyle=:zerolines)
# Plot secant line through (0.21,f(0.21)) and (0.72, f(0.72))
# 0.72 -> x + c = 0.51 + 0.21
plot!(sec_line(0.51), label="secant line")
#plot!(f', label=L"f'(x)")

annotate!([(0.19,0.19, (L"(x,f(x))", 6, :black))])
annotate!([(0.6,0.33, (L"(x + \delta x, f(x+ \delta x))", 6, :black))])

plot!([0.72,0.21],[f(0.21),f(0.21)], label="", linecolor=:black, linestyle=:dot)
plot!([0.72,0.72],[f(0.21),f(0.72)], label="", linecolor=:black, linestyle=:dot)

annotate!([(0.75,0.23, (L"\delta y", 8, :black))])
annotate!([(0.5,0.15, (L"\delta x", 8, :black))])
