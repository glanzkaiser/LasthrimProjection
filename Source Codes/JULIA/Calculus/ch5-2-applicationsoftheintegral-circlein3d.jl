using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
pyplot()
# Draw a graph of a function:
# x^2 + y^2 = 1
# z = 2x

# Alternative 1
t = 0:0.01:2*pi
x = cos.(t)
y = sin.(t)
z = 2 .* x

plot(x, y, z)

#=
# Alternative 2
plot(cos, sin, x -> 2 * cos(x), 0, 2π, xlabel="x", ylabel="y", zlabel="z", label="f")
=#
