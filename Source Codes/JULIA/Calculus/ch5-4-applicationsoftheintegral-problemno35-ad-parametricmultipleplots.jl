using Plots, LaTeXStrings
pyplot()

θ1 = 0:0.01:2π
x1 = 3 .*cos.(θ1)
y1 = 3 .*sin.(θ1)

x2 = 3 .*cos.(θ1)
y2 = sin.(θ1)

θ2 = 0:0.01:6π
x3 = θ2.*cos.(θ2)
y3 = θ2.*sin.(θ2)

x4 = cos.(θ1)
y4 = sin.(2θ1)

p1 = plot(x1, y1, xlims=(-4,4), ylims=(-4,4),
	framestyle=:zerolines)
p2 = plot(x2, y2, xlims=(-4,4), ylims=(-4,4),
	framestyle=:zerolines)
p3 = plot(x3, y3, xlims=(-20,20), ylims=(-20,20),
	framestyle=:zerolines)
p4 = plot(x4, y4, xlims=(-1.5,1.5), ylims=(-1.5,1.5),
	framestyle=:zerolines)

s1 = L"a: (x,y) = (3 \ \cos \ t, 3 \ \sin \ t)";
s2 = L"b: (x,y) = (3 \ \cos \ t, \sin \ t)";
s3 = L"c: (x,y) = (t \ \cos \ t, t \ \sin \ t)";
s4 = L"d: (x,y) = (\cos \ t, \sin \ 2t)";

plot(p1, p2, p3, p4, layout = (2, 2), 
	xaxis = "x", yaxis = "y", label=[s1 s2 s3 s4], 
	legend=:outertop)