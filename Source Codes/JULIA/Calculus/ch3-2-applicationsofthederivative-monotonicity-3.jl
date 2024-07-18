using Plots, LaTeXStrings, MTH229
gr()

f(x) = x/(1+x^2)
g(x) = f'(x)
               
plot(f, -2, 3, ylims=(-3,3),
    label=L"f(x) = \frac{x}{1 + x^{2}}", framestyle=:zerolines,
     legend=:outertop)

p1 = plot(f, -3, 3)
p2 = plot(g, -3, 3)

s1 = L"f(x) = \frac{x}{1 + x^{2}}";
s2 = L"f'(x) = \frac{1 - x^{2}}{(1 + x^{2})^{2}}";

plot(p1, p2, layout = (2, 1), legend=:outerright,
     xaxis = "x", yaxis = "y(x)", label=[s1 s2])