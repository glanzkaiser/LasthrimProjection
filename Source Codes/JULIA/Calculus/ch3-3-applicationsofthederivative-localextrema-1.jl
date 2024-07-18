using Plots, LaTeXStrings, MTH229
gr()

#f(x) = ((x-2)^3)+3
#f(x) = -(x-2)^2 + 3
f(x) = (x-2)^2 + 3

# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = 0.80
d = 2
h = 3
               
plot(f, 0, 4, ylims=(-3,10),
    label="", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, c), 0.5,1.2 , label="")
plot!(tangent(f, d), 1.5,2.6, label="")
plot!(tangent(f, h), 2.7,3.7, label="")