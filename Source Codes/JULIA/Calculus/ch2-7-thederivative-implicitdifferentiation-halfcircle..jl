using Plots, LaTeXStrings
gr()

# write pi or π is the same

f(x) = sqrt(25 - x^(2))
g(x) = -sqrt(25 - x^(2))

p1 = plot(f, -5, 5)
p2 = plot(g, -5, 5)

s1 = L"\sqrt{25 - x^{2}} ";
s2 = L"-\sqrt{25 - x^{2}}";

plot(p1, p2, layout = (2, 1), legend=:outerright,
     xaxis = "x", yaxis = "y(x)", label=[s1 s2])