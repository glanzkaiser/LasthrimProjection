using Plots, ImplicitEquations, LaTeXStrings

f(x, y) = y^2 - 3y - 4 - x
g(x,y) = x+y

plot(f ⩵ 0, xtick=-7:1:5, xlims=(-7,5), ylims=(-5,5), 
               framestyle=:zerolines,
               label="", legend=:topright)
plot!(g ⩵ 0, xtick=-7:1:5, xlims=(-7,5), ylims=(-5,5), 
               framestyle=:zerolines,
               label="", legend=:topright)

plot!((f ≦ 0) & (g ≦ 0), xlims=(-7,5), fc=:blues, 
               label="", widen=true)
