using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

f(x) = 1/(sqrt(x))

r1 = round(integrate(g,0.340472,0.627), digits = 5)
r2 = round(integrate(g,0.627,1), digits = 5)

plot(f,0,2, xtick=false, xlims=(0,1.2), ylims=(0,6.2), 
	framestyle=:zerolines, bottom_margin=5mm,
	label=L"x = \frac{1}{\sqrt{y}}", legend=:topright)

# Fill the area
plot!(f,0.340472,0.627, label="", fill=(0, 0.25, :blue))
plot!(f,0.627,1, label="", fill=(0, 0.45, :blue))

# The line that bisects the area vertically
plot!([0.627], seriestype="vline", color=:green, label="")

# Annotate the interval tick line 
annotate!([(0.340472,-0.01, (L"|", 6, :blue))])
annotate!([(0.340472,-0.27, (L"y = 0.34047", 6, :blue))])
annotate!([(0.63,-0.01, (L"|", 6, :blue))])
annotate!([(0.627,-0.27, (L"y = 0.627", 6, :blue))])
annotate!([(1,-0.01, (L"|", 6, :blue))])
annotate!([(1,-0.27, (L"y = 1", 6, :blue))])

# Annotate the area
annotate!([(0.42,1.15, ("Left area =", 6, :black))])
annotate!([(0.55,1.15, (r1, 6, :black))])
annotate!([(0.73,0.55, ("Right area = ", 6, :black))])
annotate!([(0.83,0.55, (r2, 6, :black))])

#= 
# To solve for p=0 and obtain d
d, y, z, h = symbols("d, y, z, h")

p = d-2*sqrt(d) + 7/12	

solve(p,d) 
=#

