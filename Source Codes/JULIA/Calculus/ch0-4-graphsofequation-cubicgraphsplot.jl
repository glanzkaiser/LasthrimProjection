using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()
@syms x

f(x) = x^3
g(x) = -x^3
h(x) = 3x^3 + 4x^2 - 34x - 30
j(x) = -3x^3 - 5x^2 + 43x + 5

p1 = plot(f)
p2 = plot(g)
p3 = plot(h)
p4 = plot(j)

s1 = L"y = x^{3}";
s2 = L"y = - x^{3}";
s3 = L"y = ax^{3} + bx^{2} + cx + d, \ a > 0";
s4 = L"y = ax^{3} + bx^{2} + cx + d, \ a < 0";

plot(p1, p2, p3, p4, layout = (2, 2), xaxis = "", yaxis = "y", 
	framestyle=:zerolines, legend=:outerbottom, bottom_margin=3mm, label=[s1 s2 s3 s4])
