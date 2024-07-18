using Plots, LaTeXStrings, MTH229
gr()

f(x) = sqrt(x)
               
plot(f, 0, 6, ylims=(0,8),
    label=L"f(x) = \sqrt{x}", framestyle=:zerolines,
     legend=:outerright)
plot!([4,4],[0,f(4)], label="", linecolor=:red, linestyle=:dot)
plot!([4.2,4.2],[0,f(4.2)], label="", linecolor=:black, linestyle=:dot)
plot!([4,4],[f(4),2.55], label="", linecolor=:green)
plot!([4.2,4.2],[f(4.2),2.55], label="", linecolor=:green)

plot!([4,4.2],[f(4),f(4)], label="", linecolor=:green, linestyle=:dot)

annotate!([(4,1.9, (L"-", 8, :red))])
annotate!([(4,0.05, (L"-", 8, :red))])
annotate!([(4.2,2, (L"-", 8, :black))])
annotate!([(4.2,0.05, (L"-", 8, :black))])
annotate!([(4.03,0, (L"|", 8, :black))])
annotate!([(4.23,0, (L"|", 8, :black))])
annotate!([(4.2,2.7, (L"dx = 0.6", 6, :black))])
annotate!([(4.6,2.01, (L"\} dy = 0.1", 6, :black))])
annotate!([(4.45,-0.25, (L"4 + dx", 6, :black))])
annotate!([(3.8,0.85, (L"\sqrt{4}", 6, :red))])
annotate!([(4.55,0.85, (L"\sqrt{4} + dy", 6, :black))])

scatter!([4], [f(4)], color = "red1", label="", markersize = 3)