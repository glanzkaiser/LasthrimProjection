using Plots, ImplicitEquations, LaTeXStrings

f(x) = x
g(x) = 1

plot(f,0,1, xtick=0:1:5, xlims=(0,4), ylims=(0,2), 
               framestyle=:zerolines,
               label="", legend=:topright)
plot!(g, 1,3, xtick=0:1:5, xlims=(0,4), ylims=(0,2), 
               framestyle=:zerolines,
               label="", legend=:topright)

plot!(f,0,1, label=L"R_{1}", fill=(0, 0.15, :blue))
plot!(g,1,3, label=L"R_{2}", fill=(0, 0.25, :blue))
