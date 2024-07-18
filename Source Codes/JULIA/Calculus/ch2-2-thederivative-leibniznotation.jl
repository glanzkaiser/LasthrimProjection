using Plots, LaTeXStrings, MTH229
gr()

f(x) = x^3 + 2

# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

c = -0.80
d = 0
h = 1.1
               
plot(f, -2, 4, ylims=(-3,10),
    label=L"f(x) = x^{3}+2", framestyle=:zerolines,
     legend=:outerright)
plot!(tangent(f, c), -1.5,-0.2 , label="tangent line for f(-0.8)")
plot!(tangent(f, d), -1,1, label="tangent line for f(0)")
plot!(tangent(f, h), 0.8,1.7, label="tangent line for f(1.1)")
