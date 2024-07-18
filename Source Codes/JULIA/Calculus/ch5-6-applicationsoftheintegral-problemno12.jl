using Plots, LaTeXStrings
gr()

f(x) = 0.5*(x^2 - 10)

plot(f,-5,5, xtick=-2:2:2, xlims=(-5,5), ylims=(-6,4), 
	framestyle=:zerolines,
	label="", legend=:topright)

plot!(f,-2,2, label="", fill=(0, 0.15, :blue))

plot!([2,2],[0,f(2)], label="", linecolor=:green)
plot!([-2,-2],[0,f(-2)], label="", linecolor=:green)

