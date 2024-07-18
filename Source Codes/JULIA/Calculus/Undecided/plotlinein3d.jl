using Plots
gr()

x = range(-2π,2π)
plot(x,sin.(x),cos.(x))
