using Plots, LaTeXStrings
pyplot()

θ1 = 0:0.01:2π
x1 = cos.(3θ1)
y1 = sin.(2θ1)

θ2 = 0:0.01:40
x2 = cos.(θ2)
y2 = sin.(π.*θ2)

p1 = plot(x1, y1, xlims=(-1.1,1.1), ylims=(-1.1,1.1),
	framestyle=:zerolines)
p2 = plot(x2, y2, xlims=(-1.1,1.1), ylims=(-1.1,1.1),
	framestyle=:zerolines)

s1 = L"e: (x,y) = (\cos \ 3t, \sin \ 2t)";
s2 = L"f: (x,y) = (\cos \ t, \sin \ \pi t)";

plot(p1, p2, layout = (1, 2), 
	xaxis = "x", yaxis = "y", label=[s1 s2], 
	legend=:outertop)