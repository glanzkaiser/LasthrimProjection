using Plots, LaTeXStrings, MTH229
gr()

f(x) = 1/x^2
               
plot(f, -2, 2, ylims=(-1,4),
    label=L"f(x) = \frac{1}{x^{2}} + \{(0,1)\}", framestyle=:zerolines,
     legend=:outerright)
scatter!([0], [1], color = "green1", label="", markersize = 3)

# Calculate the integral with 50,000 partitions at interval [-2,2]
# riemann(f, -2, 2, 50_000)