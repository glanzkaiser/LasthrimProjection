using Plots, LaTeXStrings, MTH229
gr()

f(x) = (x^3)/3 - x^2 - 3x + 4
g(x) = f'(x)
h(x) = g'(x)

p1 = plot(f, -3, 6)
p2 = plot(g, -3, 6)
p3 = plot(h, -3, 6)

s1 = L"f(x) = \frac{1}{3}x^{3} - x^{2} - 3x + 4";
s2 = L"f'(x)";
s3 = L"f''(x)";

plot(p1, p2, p3, layout = (3, 1), legend=:outerright,
     xaxis = "x", yaxis = "y(x)", label=[s1 s2 s3])