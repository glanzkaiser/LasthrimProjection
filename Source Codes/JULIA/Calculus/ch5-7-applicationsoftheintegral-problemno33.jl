using Plots,LaTeXStrings,Colors
gr()

x1 = 0:1:1
y1 = 0.8:0.1:0.9

x = 1:1:4
y = 0.9:0.05:1.05

# Plot configuration
plot(legend_title=L"F(x)", 
	legend=:bottomleft,legend_foreground_color=:white, 
	legend_title_font_color=:blue, color=:blue, 
	framestyle=:origin, ticks=x, yticks=true)

# Steps drawing
for i in 1:length(x1)-1
    plot!(x1[i:i+1], [y1[i], y1[i]], label="", color=:blue, lw=2)
end

for i in 1:length(x)-1
    plot!(x[i:i+1], [y[i], y[i]], label="", color=:blue, lw=2)    
end

scatter!(x[1:end-1], y[1:end-1], markersize=3, markercolor=:blue4, label="")
scatter!(x[2:end-1], y[1:end-1], markersize=3, markercolor=:white, label="")

scatter!(x1[1:end-1], y1[1:end-1], markersize=3, markercolor=:blue4, label="")
scatter!(x1[2:end], y1[1:end-1], markersize=3, markercolor=:white, label="")
