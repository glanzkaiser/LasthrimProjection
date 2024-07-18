# scatter expects a vector of numbers
# might as well just pull it out of the loop and write scatter!(x[2:length(x)-1], y[2:length(x)-1]) 
using Plots; gr()

f(x) = floor(x + 1/2)
x = -5.5:1:4.5
y = f.(x)
plot(x[1:2], [y[1], y[1]], label=L"f(x) = \lfloor x + 1/2 \rfloor", legend=:bottomleft,legend_foreground_color=:white, legend_font_color=:blue, color=:blue, showaxis=false, tickfontcolor=:white)
# axis and 
hline!((0,0), color=:black, label="")
vline!((0,0), color=:black, label="")

for i in x
	if i!= 0
		annotate!(i,-0.2, (i, 7))
	end
end
for i in y
	if i != 0
		annotate!(-.2, i, (i, 7))
	end
end
annotate!(-.2, -.2, ("0", 7))
for i in 2:length(x)-1
	plot!(x[i:i+1], [y[i], y[i]], label="", color=:blue, lw=2)	
end
  
scatter!(x[1:end-1], y[1:end-1], markersize=3, markercolor=:blue, label="")
scatter!(x[2:end], y[1:end-1], markersize=3, markercolor=:white, label="")
