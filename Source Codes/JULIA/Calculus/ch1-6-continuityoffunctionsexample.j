using Plots, LaTeXStrings
pyplot() 
#gr()

f(x) = (x^(2) -4)/(x-2)
g(x) = x+2

p1 = plot(f, -8, 8)
p2 = plot(g, -8, 8)

l1 = L"\lim_{x \rightarrow 2} \ \frac{x^{2} - 4}{x-2}"
l2 = L"\lim_{x \rightarrow 2} \ x+2"

plot(p1, p2, layout = (1, 2), xaxis = "x", yaxis = "y", label="", legend=:outertop,
title=[l1 l2],
titleloc = :bottom, titlefont = font(10))
