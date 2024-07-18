using Plots, LaTeXStrings; gr()

f(x) = x^2

plot(f, 0,1, xlims=(0,1.2), ylims=(0,1.2), 
	framestyle=:zerolines, label=L"y = x^{2}", linecolor=:blue2)

plot!(f,0,0, label="", fill=(0, 0.15, :blue))
plot!([3,0],[1,1], label="", linecolor=:black)
plot!(f, 0,1, 
	fillrange = 1, fillalpha = 0.35, c = 1, 
	label = "")
