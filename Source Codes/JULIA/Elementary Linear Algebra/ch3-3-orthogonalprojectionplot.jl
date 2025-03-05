using Plots, LaTeXStrings, CalculusWithJulia
pyplot()

u = [0,2]
v = [3,0]
w = u+v
p = [0,0]

quiver(unzip([p])..., quiver=unzip([u]), linecolor=:green)
quiver!(unzip([p])..., quiver=unzip([v]), linecolor=:green)
quiver!(unzip([p])..., quiver=unzip([w]), linecolor=:green)

plot!([3,3],[0,2], linecolor=:green, linestyle=:dash, label="")
plot!([0,3],[2,2], linecolor=:green, linestyle=:dash, label="")

annotate!([(1.1,0.1, (L"\vec{w_{1}}", 8, :black)),
          (1.3,1.1, (L"\vec{u} = \vec{w_{1}} + \vec{w_{2}}", 8, :black)),
	  (0.15,1.1, (L"\vec{w_{2}}", 8, :black))])