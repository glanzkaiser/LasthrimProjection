using Plots, LaTeXStrings, MTH229
gr()

f(x) = 4x - x^2

# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = 3
d = 1
               
plot(f, -2, 6, ylims=(-3,10),
    label=L"f(x) = 4x - x^{2}", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, c), 1,4 , label="tangent line for f(3)")
plot!(tangent(f, d), -1,3, label="tangent line for f(1)")

scatter!([2], [5], color = "red1", label="(2,5)", markersize = 3)
annotate!([(1.2,5, (L"(2,5)", 10, :black))])