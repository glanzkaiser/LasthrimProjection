using Plots, LaTeXStrings, Plots.PlotMeasures; gr()

x₁, x₂, x₃, x₄ = 0,6,6,0
y₁, y₂, y₃, y₄ = 0,0,-3,-3

a₁, a₂, a₃, a₄ = 0,6,6,0
b₁, b₂, b₃, b₄ = -2,-2,-5,-5

c₁, c₂, c₃ = 0,6,3
d₁, d₂, d₃ = 0,0,-5.19

e₁, e₂, e₃ = 0,3,0
f₁, f₂, f₃ = -3,-3,-7

xs = [x₁, x₂, x₃, x₄, x₁] # Vertices' x-component
ys = [y₁, y₂, y₃, y₄, y₁] # Vertices' y-component

as = [a₁, a₂, a₃, a₄, a₁] # Vertices' x-component
bs = [b₁, b₂, b₃, b₄, b₁] # Vertices' y-component

cs = [c₁, c₂, c₃, c₁] # Vertices' x-component
ds = [d₁, d₂, d₃, d₁] # Vertices' y-component

es = [e₁, e₂, e₃, e₁] # Vertices' x-component
fs = [f₁, f₂, f₃, f₁] # Vertices' y-component

p1 = plot(xs, ys, xlims=(-1,7), ylims=(-4,1),
	framestyle=:zerolines, label="")
p2 = plot(as, bs, xlims=(-1,7), ylims=(-6,1),
	framestyle=:zerolines, label="")
p3 = plot(cs, ds, xlims=(0,7), ylims=(-7,1),
	framestyle=:zerolines, label="")
p4 = plot(es, fs, xlims=(0,4), ylims=(-8,0),
	framestyle=:zerolines, label="")

s1 = L"a";
s2 = L"b";
s3 = L"c";
s4 = L"d";

plot(p1, p2, p3, p4, layout = (2, 2), 
	xaxis = "x", yaxis = "y", label=[s1 s2 s3 s4], 
	legend=:outertop)

