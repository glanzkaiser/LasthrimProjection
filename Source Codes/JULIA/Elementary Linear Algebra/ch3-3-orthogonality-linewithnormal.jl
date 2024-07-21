using LazySets, LaTeXStrings
using Plots: plot, plot!, text, lens!, bbox
gr()
p(args...; kwargs...) = plot(xlims=(0,4), ylims=(0,4), ratio=1, lab="",
                        xlab=L"x_{1}", ylab=L"x_{2}", args...; kwargs...)
p!(args...; kwargs...) = plot!(lab="", args...; kwargs...);

p(xlims=(0,2), ylims=(0,2))
a = [1.0, 1.0]
b = 2.0

H = Hyperplane(a, b)

p!(H, linewidth=2)

# normal arrow
p!([1.0, 1.5], [1.0, 1.5], linecolor=:red, arrow=:arrow,
    linestyle=:dash, width=2, annotations=(1.15, 1.3, text(L"\textbf{n}", 10)))
p!([1.0, 0.5], [1.0, 1.5], linecolor=:red, arrow=:arrow,
    linestyle=:dash, width=2, annotations=(0.75, 1.5, text(L"P(x,y)", 10)))

annotate!([(1.5, 1.6, text(L"(a,b)", 10)), 
           (0.75, 1.0, text(L"P_{0}(x_{0},y_{0})", 10))])

scatter!([1], [1], color = "red", label="", markersize = 4)
scatter!([1.5], [1.5], color = "red", label="", markersize = 4)
scatter!([0.5], [1.5], color = "red", label="", markersize = 4)