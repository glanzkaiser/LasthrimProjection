using CalculusWithJulia, Plots, SymPy

@syms x y
x0, y0 = 0, 0

F(y, x) = 0.2y*(16-y)
plot(legend=false)
vectorfieldplot!((x,y) -> [1, F(y,x)], xlims=(x0, 14), ylims=(y0, y0+50))

g(x) =  16 - 13*exp(-0.2x)
plot!(g,  linecolor=:blue, linewidth=2)