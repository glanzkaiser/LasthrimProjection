using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

# For the curve
f(x) = x^3
g(x)=f(-x)

plt = plot(;xtick=false, xlims=(-2,2), ylims = (0, 5), 
	 legend = :topright, framestyle=:zerolines, label = "", bottom_margin=10mm)
a= π/2

# For the circle
θ = 0:0.1:2π
x1 = 0 .+ 1cos.(θ) 
y1 = 1 .+ 0.33sin.(θ) 
x2 = 0 .+ 0.95cos.(θ) 
y2 = 0.85 .+ 0.33sin.(θ) 
x3 = 0 .+ 1.5cos.(θ) 
y3 = 3.3 .+ 0.33sin.(θ) 

# Plotting time
plot!(plt, f, 0, a, label="")
plot!(plt, g, -a, 0, label="")

plot!(x1, y1, aspect_ratio=:equal, label=L"V = \int_{0}^{3} \pi y^{2/3} \ dy", fill=(0, 0.86, :blue2)) # The middle circle plot
plot!(x2, y2, aspect_ratio=:equal, label="", linecolor=:transparent, fill=(0, 0.23, :blue2)) # The bottom circle plot
plot!(x3, y3, aspect_ratio=:equal, label="") # The top circle plot
