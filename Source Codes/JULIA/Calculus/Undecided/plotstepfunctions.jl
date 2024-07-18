using Plots,LaTeXStrings,Colors
gr()

f(x) = floor(x)
x = -5:1:4
y = f.(x)
# Plot configuration
plot(legend_title=L"f(x) = \lfloor x \rfloor", legend=:bottomleft,legend_foreground_color=:white, legend_title_font_color=:blue, color=:blue, framestyle=:origin, ticks=x)

# Steps drawing
for i in 1:length(x)-1
    plot!(x[i:i+1], [y[i], y[i]], label="", color=:blue, lw=2)
end

scatter!(x[1:end-1], y[1:end-1], markersize=3, markercolor=:blue4, label="")
scatter!(x[2:end], y[1:end-1], markersize=3, markercolor=:white, label="")
