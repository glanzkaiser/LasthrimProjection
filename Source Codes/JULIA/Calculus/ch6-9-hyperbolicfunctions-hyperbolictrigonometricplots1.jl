using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()
@syms x

f(x) = sinh.(x)
g(x) = cosh.(x)
h(x) = tanh.(x)
j(x) = sech.(x)

p1 = plot(f)
p2 = plot(g)
p3 = plot(h)
p4 = plot(j)

s1 = L"y = \sinh \ x";
s2 = L"y = \cosh \ x";
s3 = L"y = \tanh \ x";
s4 = L"y = sech \ x";

plot(p1, p2, p3, p4, layout = (2, 2), xaxis = "", yaxis = "y", 
	framestyle=:zerolines, legend=:outerbottom, bottom_margin=3mm, label=[s1 s2 s3 s4])
