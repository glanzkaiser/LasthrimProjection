using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()
@syms x

f(x) = x^2
g(x) = -x^2
h(x) = x^2 + 0.2x - 3
j(x) = -x^2 + 0.3x + 5

p1 = plot(f)
p2 = plot(g)
p3 = plot(h)
p4 = plot(j)

s1 = L"y = x^{2}";
s2 = L"y = - x^{2}";
s3 = L"y = ax^{2} + bx + c, \ a > 0";
s4 = L"y = ax^{2} + bx + c, \ a < 0";

plot(p1, p2, p3, p4, layout = (2, 2), xaxis = "", yaxis = "y", 
	framestyle=:zerolines, legend=:outerbottom, bottom_margin=3mm, label=[s1 s2 s3 s4])
