using Plots, LaTeXStrings, MTH229
gr()

f(x) = 1+x^2
g(x) = 2 - x^2

# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)
tangent(g, c) = x -> g(c) + g'(c)*(x-c)

c = -2.20
d = -0.5
h = 1.1
i = 2.4

p1 = plot(f, -3, 3)
p2 = plot(g, -3, 3)

s1 = "";
s2 = "";

plot!(p1,tangent(f, c), -2.8,-1.6 , label="")
plot!(p1,tangent(f, d), -1.3,0.1, label="")
plot!(p1, tangent(f, h), 0.5,1.7, label="")
plot!(p1, tangent(f, i), 1.8,3, label="")

plot!(p2, tangent(g, c), -2.8,-1.6 , label="")
plot!(p2, tangent(g, d), -1.3,0.1, label="")
plot!(p2, tangent(g, h), 0.5,1.7, label="")
plot!(p2, tangent(g, i), 1.8,3, label="")

plot(p1, p2, layout = (2, 1), legend=:outerright,
     xaxis = "x", yaxis = "y(x)", label=[s1 s2])