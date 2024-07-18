using Plots, LaTeXStrings, MTH229
gr()

f(x) = x/(1+x^2)
g(x) = f'(x)
h(x) = g'(x)

p1 = plot(f, -4, 4)
p2 = plot(g, -4, 4)
p3 = plot(h, -4, 4)

s1 = L"g(x) = \frac{x}{1 + x^{2}}";
s2 = L"g'(x)";
s3 = L"g''(x)";

plot(p1, p2, p3, layout = (3, 1), legend=:outerright,
     xaxis = "x", yaxis = "y(x)", label=[s1 s2 s3])